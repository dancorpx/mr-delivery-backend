# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(id: 1,
    open_id: "example1",
    student_number: "2015141726467",
    name: "Dennis Profit",
    phone_number: "18114589635",
    address_name: "dormitory #1",
    address_lat: 30.00001,
    address_lng: 104.00001)
User.create!(
    open_id: " example2",
    student_number: "2016141726467",
    name: "Ling Ezzell",
    phone_number: "18114589624",
    address_name: "dormitory #2",
    address_lat: 30.00011,
    address_lng: 104.00001)
User.create!(
    open_id: "example3",
    student_number: "2017141726467",
    name: "Wade Wesson",
    phone_number: "18114589846",
    address_name: "dormitory #3",
    address_lat: 30.00101,
    address_lng: 104.00001)
User.create!(
    open_id: "example4",
    student_number: "2018141726467",
    name: "Izetta Zehner",
    phone_number: "18114589471",
    address_name: "Library",
    address_lat: 30.01001,
    address_lng: 104.00001)
User.create!(open_id: "example5",
    student_number: "2015141726467",
    name: "å¼ æ†¨æ†¨",
    phone_number: "18114589463",
    address_name: "å®¿èˆæ¥¼ #1",
    address_lat: 31.00001,
    address_lng: 104.00001)
