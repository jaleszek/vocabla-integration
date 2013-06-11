require 'rubygems'
require 'roo'

module ExcelReader
  def getUser language
    excel= Roo::Excel.new("users.xls")
    excel.default_sheet = excel.sheets.first
    LOCATOR['first_row_number'].upto(excel.last_row) do |line|
    lang = excel.cell(line,'D')
    if lang == language
      return excel.cell(line,'B')
    end      
    end
  end
end
