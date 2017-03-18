class AppliesController < ApplicationController

  def create
    @job = Job.find params[:job_id]
    a   = Apply.new(job: @job, user: current_user)
    respond_to do |format|
      if a.save
        format.html {redirect_to job_path(@job)}
        format.js {render :create_success}
      else
        format.html {redirect_to job_path(@job)}
        format.js {render js: "There was a problem."}
      end
    end
  end

  def destroy
    apply     = Apply.find params[:id]
    @job = Job.find params[:job_id]
    respond_to do |format|
      if can? :destroy, Apply
        apply.destroy
        format.html {redirect_to job_path(@job)}
        format.js {render :destroy}
      else
        format.html {redirect_to job_path(@job)}
        format.js {render js: "There was a problem."}
      end
    end
  end
end
