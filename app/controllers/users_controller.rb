class UsersController < ApplicationController

  def user_jobs
    @user_jobs = current_user.jobs
    @job = Job.find(params[:id])
  end

end
