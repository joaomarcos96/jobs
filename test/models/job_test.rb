require 'test_helper'

class JobTest < ActiveSupport::TestCase
  setup do
    @job = jobs :ruby_job
  end

  test 'should save valid job' do
    assert @job.save
  end

  test 'should not save job without title' do
    job = @job
    job[:title] = nil

    refute job.valid?
    assert_not job.save
  end

  test 'should not save job with a past date' do
    job = @job
    job[:close_date] = Date.yesterday

    refute job.valid?
    assert_not job.save
  end
end
