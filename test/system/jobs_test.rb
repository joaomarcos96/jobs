require 'application_system_test_case'

class JobsTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit jobs_url

    assert_selector 'h1', text: 'Career'
  end

  test 'adding a valid job opportunity' do
    visit jobs_url

    click_on 'Add Job Opportunity'

    fill_in 'Job Title', with: 'Ruby Developer'
    fill_in 'Level', with: 'Entry level'
    fill_in 'Job Nature', with: 'Full time'
    fill_in 'Close date', with: Date.tomorrow

    click_on 'Submit'

    assert_text 'Job opportunity successfully added'
  end

  test 'adding an invalid job opportunity, with a past date' do
    visit jobs_url

    click_on 'Add Job Opportunity'

    fill_in 'Job Title', with: 'Ruby Developer'
    fill_in 'Level', with: 'Entry level'
    fill_in 'Job Nature', with: 'Full time'
    fill_in 'Close date', with: Date.yesterday

    click_on 'Submit'

    assert_text 'must be in the future'
  end
end
