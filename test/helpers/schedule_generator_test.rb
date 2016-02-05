require 'test_helper'

class ScheduleGeneratorTest < ActiveSupport::TestCase
  test "Ensure the schedule generator...does" do 
    ScheduleGenerator.instance.reGenerateSchedule
    shift_count = Shift.count()
    assert shift_count > 0, 'Shift count == 0'
  end
end