class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new profile_params
     @profile.user_id = current_user.id
    if @profile.save
      redirect_to profile_path(@profile), notice: "Profile created successfully!"
    else
      flash[:alert] = "Profile creation unsuccessful."
      render :new
    end
  end

  def show
    if current_user.student? == true
      @profile = current_profile
    else
      @profile = Profile.find params[:id]
    end
    @user = User.find(@profile.user_id)
  end

  def edit
    @profile = current_profile
  end

  def update
    @profile = Profile.find params[:id]
    if @profile.update profile_params
      redirect_to profile_path(@profile), notice: "Profile updated!"
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:description, :age, :city, :school, :experience, :phone_number, :user_id, :image, :remove_image, :remote_image_url)
  end

end
