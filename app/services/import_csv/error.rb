class ImportCSV
  class Error < StandardError
    attr_reader :error, :row, :row_number

    def initialize error, row, row_number
      @row = row
      @row_number = row_number
      @error = error.class
      super " caused by - #{error.class}: #{error.message}" + "\n row ##{row_number}: #{row}"
    end
  end
end
