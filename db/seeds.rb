# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "csv"
require "faker"

# Too many data, limit the amount
MAX_ADDRESSES_PER_SDW = 10
MAX_SCHOOLS_PER_SDW = 10

Faker::UniqueGenerator.clear
Seat.in_batches.destroy_all
School.in_batches.destroy_all
HomeAddress.in_batches.destroy_all
SchoolDivisionWard.in_batches.destroy_all
Ward.in_batches.destroy_all
SchoolDivision.in_batches.destroy_all

schools_file = Rails.root.join("db/Province_of_Manitoba_-_Public_And_Independent_Schools_Enrolments.csv")
puts "Loading schools from the csv file: #{schools_file}"
schools_data = File.read(schools_file)
schools = CSV.parse(schools_data, headers: true, encoding: "utf-8")
puts "Loaded schools (#{schools.count} items)"

addresses_file = Rails.root.join("db/Addresses.csv")
puts "Loading addresses from the csv file: #{addresses_file}"
addresses_data = File.read(addresses_file)
addresses = CSV.parse(addresses_data, headers: true, encoding: "utf-8")
puts "Loaded addresses (#{addresses.count} items)"

addresses.each_with_index do |address, idx|
  puts "looping to #{idx} addresses..." if idx % 10_000 == 0

  unless address["Ward"] && address["School Division"] && address["Street Name"] && address["Street Number"]
    next
  end

  ward = Ward.find_or_create_by(name: address["Ward"])
  next unless ward&.valid?

  school_division = SchoolDivision.find_or_create_by(name: address["School Division"])
  next unless school_division&.valid?

  school_division_ward = SchoolDivisionWard.find_by(
    school_division: school_division,
    ward:            ward
  )
  unless school_division_ward&.valid?
    school_division_ward = SchoolDivisionWard.create(
      name:            Faker::Address.community,
      school_division: school_division,
      ward:            ward
    )
  end
  next unless school_division_ward&.valid?

  home_address = HomeAddress.find_by(
    street_name:   address["Street Name"],
    street_number: address["Street Number"]
  )
  next if home_address&.valid? || school_division_ward.home_addresses.count >= MAX_ADDRESSES_PER_SDW

  HomeAddress.create(
    street_name:          address["Street Name"],
    street_number:        address["Street Number"],
    school_division_ward: school_division_ward
  )
end

puts "Created #{Ward.count} Wards."
puts "Created #{SchoolDivision.count} SchoolDivisions."
puts "Created #{SchoolDivisionWard.count} SchoolDivisionWards."
puts "Created #{HomeAddress.count} HomeAddresses."

schools.each_with_index do |school, idx|
  puts "looping to #{idx} schools..." if idx % 1000 == 0

  # Only use data of latest year, which is 2019.
  next unless school["Year"] == "2019"
  next unless school["School Division/Independent School"] && school["School Name"]

  # Ensure that the school_division_ward to which the school is assigned belongs to the school's school_division.
  school_division = SchoolDivision.find_by(name: school["School Division/Independent School"])
  next unless school_division&.valid?

  school_division_ward = school_division.school_division_wards.sample
  next if school_division_ward.schools.count >= MAX_SCHOOLS_PER_SDW

  school = School.create(
    name:                 school["School Name"],
    nursery:              school["Nursery"],
    kindergarten:         school["Kindergarten"],
    grade1:               school["Grade 1"],
    grade2:               school["Grade 2"],
    grade3:               school["Grade 3"],
    grade4:               school["Grade 4"],
    grade5:               school["Grade 5"],
    grade6:               school["Grade 6"],
    grade7:               school["Grade 7"],
    grade8:               school["Grade 8"],
    grade9:               school["Grade 9"],
    grade10:              school["Grade 10"],
    grade11:              school["Grade 11"],
    grade12:              school["Grade 12"],
    school_division_ward: school_division_ward
  )
  next unless school&.valid?

  school_division_ward.home_addresses.each do |home_address|
    Seat.create(
      school:       school,
      home_address: home_address
    )
  end
end

puts "Created #{School.count} Schools."
puts "Created #{Seat.count} Seats."
