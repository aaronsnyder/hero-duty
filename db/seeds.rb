# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Employee.create([
  {first_name: 'Sherry',password: 'sherry'},
  {first_name: 'Boris',password: 'boris'},
  {first_name: 'Vicente',password: 'vicente'},
  {first_name: 'Matte',password: 'matte'},
  {first_name: 'Jack',password: 'jack'},
  {first_name: 'Kevin',password: 'kevin'},
  {first_name: 'Zoe',password: 'zoe'},
  {first_name: 'Jay',password: 'jay'},
  {first_name: 'Eadon',password: 'eadon'},
  {first_name: 'Franky',password: 'franky'},
  {first_name: 'Luis',password: 'luis'},
  {first_name: 'James',password: 'james'}
])

ScheduleGenerator.instance.reGenerateSchedule