require 'csv'

class ImportCSV
  def initialize block_on_each_row, required_headers, file_path, async, caller_phone, post_import_block = -> {}
    @block_on_each_row = block_on_each_row
    @required_headers = required_headers
    @file_path = file_path
    @caller_phone = caller_phone
    @async = async
    @post_import_block = post_import_block
  end

  def call
    validate_csv_headers! @file_path, @required_headers
    LongRunningJob.start @async, -> {
      perform @file_path, @block_on_each_row, @caller_phone
      @post_import_block.call
    }
  end

  def validate_csv_headers! file_path, required_headers
    base_row = CSV.read(file_path).each.first
    difference = required_headers.map(&:to_s) - base_row.map(&:to_s)
    if !difference.empty?
      raise StandardError.new "CSV headers are wrong. Missing: #{difference}  Current: #{base_row}"
    end
  end

  def perform file_path, block, caller_phone
    Rails.logger.info 'Import Job Started!'

    csv = CSV.read(file_path, headers: true)
    total_count = csv.count.to_f ## Optimisation to prevent calculating total count every time

    ## Traverse through each row
    csv.each_with_index do |row, i|
      begin
        Rails.logger.info "Progress #{(i/total_count * 100).round(2)}%" if i%10 == 0
        block.call row.to_h ## Delegate control to block

      rescue StandardError => ex
        ex_with_context = Error.new(ex, row.to_h, i + 2)
        # SMS.send_import_job_error ex_with_context, caller_phone if caller_phone
        raise ex_with_context
      end
    end

    #SMS.send_success caller_phone if caller_phone
    Rails.logger.info 'Import Job Done!'
  end
end
