require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job = jobs :ruby_job
  end

  test 'should get index' do
    get jobs_url
    assert_response :success
  end

  test 'should create job' do
    assert_difference 'Job.count' do
      post jobs_url, params: params
    end

    assert_redirected_to jobs_url
  end

  test 'should not create invalid job' do
    assert_no_changes 'Job.count' do
      post jobs_url, params: { job: { title: nil } }
    end

    assert_template :index
  end

  test 'should not create job with a past date' do
    invalid_params = params
    invalid_params[:job][:close_date] = Date.yesterday

    assert_no_changes 'Job.count' do
      post jobs_url, params: invalid_params
    end

    assert_template :index
  end

  private

    def params
      {
        job: {
          title: @job.title,
          level: @job.level,
          nature: @job.nature,
          close_date: @job.close_date
        }
      }
    end
end
