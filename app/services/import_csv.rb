require 'csv'

class ImportCSV
  def self.for_each_row file_path, &block
    csv = CSV.read(file_path, headers: true)

    total_count = csv.count.to_f ## Optimisation to prevent calculating total count every time

    ## Traverse through each row
    csv.each_with_index do |row, i|
      begin
        Rails.logger.info "Progress #{(i/total_count * 100).round(2)}%" if i%10 == 0

        block.call row.to_h ## Delegate control to block

      ## Wraps context around original error
      rescue StandardError => ex
        raise Error.new(ex, row.to_h, i + 2)

      end
    end
  end
end
