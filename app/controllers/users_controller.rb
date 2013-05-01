class UsersController < ApplicationController
  before_filter :authenticate_user!
  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def update
    @user = User.find params[:id]
    authorize! :manage, @user
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Uable to update user."
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find params[:id]
    authorize! :manage, @user
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

end
