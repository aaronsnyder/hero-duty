# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Employee.create([
  {first_name: 'Sherry',password: 'Sherry'},
  {first_name: 'Boris',password: 'Boris'},
  {first_name: 'Vicente',password: 'Vicente'},
  {first_name: 'Matte',password: 'Matte'},
  {first_name: 'Jack',password: 'Jack'},
  {first_name: 'Kevin',password: 'Kevin'},
  {first_name: 'Zoe',password: 'Zoe'},
  {first_name: 'Jay',password: 'Jay'},
  {first_name: 'Eadon',password: 'Eadon'},
  {first_name: 'Franky',password: 'Franky'},
  {first_name: 'Luis',password: 'Luis'},
  {first_name: 'James',password: 'James'}
])

ScheduleGenerator.instance.reGenerateSchedule