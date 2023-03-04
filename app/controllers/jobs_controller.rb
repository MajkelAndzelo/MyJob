class JobsController < ApplicationController
  def show
    @jobs = Job.all
    @jobs = Job.paginate(page: params[:page], per_page: 1)
  end

  def new
    @job = Job.new
    @job = Job.new(posted_date: DateTime.current)
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to jobs_path, notice: "Job listing created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])

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
