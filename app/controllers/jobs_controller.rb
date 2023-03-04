class JobsController < ApplicationController
  include ApplicationHelper
 
  def show
    raise "test"
    @jobs = Job.all
    @jobs = Job.paginate(page: params[:page], per_page: 1)
  end

  def new
    @job = current_user.jobs.build
    @job.posted_date = DateTime.current
  end
  

  def create
    @job = current_user.jobs.build(job_params)

    if @job.save
      redirect_to jobs_path, notice: "Job listing created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @job = Job.find(params[:id])
  
    if @job.user != current_user
      redirect_to jobs_path, alert: "You are not authorized to edit this job listing."
    end
  end

  def update
    @job = Job.find(params[:id])
  
    # Check if the current user is the owner of the job listing
    if @job.user != current_user
      redirect_to jobs_path, alert: "You are not authorized to edit this job listing."
      return
    end
  
    if @job.update(job_params)
      redirect_to jobs_path, notice: "Job listing updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to jobs_path, notice: "Job listing deleted successfully!"
  end
  def show_details
    @job = Job.find(params[:id])
  end

  private

  def job_params
    params.require(:job).permit(:title, :company, :location, :posted_date, :expiration_date, :description, :salary)
  end
end
