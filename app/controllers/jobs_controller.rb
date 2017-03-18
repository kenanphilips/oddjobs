class JobsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_job, only: [:show, :edit, :update, :destroy]


  def new
    @job = Job.new
  end

  def create
    @job = Job.new job_params
    @job.user_id = current_user.id
    if @job.save
      redirect_to job_path(@job), notice: "Job Created Successfully"
    else
      flash[:alert] = "there was a problem"
      render :new
    end
  end

  def index
    @jobs = Job.search(params[:search]).order('created_at DESC')
    if params[:category].blank?
      @jobs = Job.all.order('created_at DESC')
    else
      @category_id = Category.find_by(name: params[:category]).id
      @jobs = Job.where(category_id: @category_id).order('created_at DESC')
    end

    # @jobs = Job.search(params[:search]).order('created_at DESC')
    # if @jobs.class == Array && params[:category].blank?
    #   @jobs = Kaminari.paginate_array(@jobs).page(params[:page]).per(10).order('created_at DESC')
    # else
    #   @category_id = Category.find_by(name: params[:category]).id
    #   @jobs = Job.where(category_id: @category_id).order('created_at DESC')
    # end

  end

  def show
    @users = find_job.users
  end

  def edit
  end

  def update
    if @job.update job_params
      redirect_to job_path(@job), notice: "Job updated"
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path(@jobs)
    flash[:notice] = "Job deleted"
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :requirements, :address, :wage, :start_date, :end_date, :user_id, :category_id)
  end

  def find_job
    @job = Job.find(params[:id])
  end

end
