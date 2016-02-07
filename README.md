# Hero Duty
### Supporting Support Heroes with Style!

##### Background
-----
This Rails application was built as a challenge project with the following requirements:
* Display today’s Support Hero.
* Display a single user’s schedule showing the days they are assigned to Support Hero.
* Display the full schedule for all users in the current month.
* Users should be able to mark one of their days on duty as undoable.
    * The system should reschedule accordingly.
    * Should take into account weekends and California’s holidays.
* Users should be able to swap duty with another user’s specific day.

##### Installation and Setup on OS X (assumes prior installation of Ruby 2.2.3 and Rails 4.1.12)
-----
1. clone from GitHub to your local machine: 
        
        git clone https://github.com/aaronsnyder/hero-duty.git
2. change to the install directory:

        cd hero-duty
3. install the dependancies:

        bundle install
4. setup the database:

        rake db:setup
5. start your server:

        rails s
6. Navigate to the app in your browser (default should be http://localhost:3000)

##### Usage Information
-----
The DB is seeded with the following users:

        [
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
          {first_name: 'James',password: 'james'},
          {first_name: 'Admin',password: 'admin'}
        ]

You must be logged in as a user to perform actions such as shift-swapping, adding work restrictions, and picking up shifts.

You must be logged in as admin to re-generate the schedule for the current month or to manually generate the schedule for next month. Neither of these actions are required for normal operation.

##### Additional Settings
-----
Additional settings are available to alter application behavior. 

If shifts should automatically be rescheduled when an employee indicates that they're unavailable: 

          autoswap_shift_when_unavailable:
              true
              
Note, when disabled, employees will have the oppertunity to pick up any shift for which the assigned employee has become unavailable, rather than being force-swapped.               

If employees should not be assigned shifts on weekends, you can disable this behavior by setting: 

          skip_weekends:
              true
              
If employees should not be assigned shifts on holidays, you can disable this behavior by setting:

          skip_holidays:
              true

If the preferred shift order needs to be updated, it can be altered by changing:
          
          predefined_shift_order:
              - Sherry
              - Boris
              - ...