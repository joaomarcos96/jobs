class JobsController < ApplicationController
  def index
    @jobs = Job.all
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to jobs_path, notice: 'Job opportunity successfully added'
    else
      render :index
    end
  end

  private

    def job_params
      params.require(:job).permit(:title, :level, :nature, :close_date)
    end
end
