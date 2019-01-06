# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'spreadsheet'
require 'simple_xlsx_reader'

poetry_attributes = []
poetry_attributes_dict = Hash.new

puts poetry_attributes_dict


workbook = SimpleXlsxReader.open './db/poesiedautore.xlsx'
worksheets = workbook.sheets
worksheets.each do |worksheet|
  num_rows = 0
  worksheet.rows.each do |row|
    row_cells = row
    title = row[0]
    body = row[1]
    author = row[2]
    num_rows += 1
    poetry_attributes_dict[:title] = title
    poetry_attributes_dict[:body] = body
    poetry_attributes_dict[:author] = author
    poetry_attributes << {title: title, body: body, author: author}
  end

end


puts 'Cleaning database...'
Poetry.destroy_all

puts 'Creating poetries...'

Poetry.create!(poetry_attributes)
puts 'Finished!'


