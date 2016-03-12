class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    
    @user = User.new(user_params)
    
      if @user.save
        log_in @user
        flash[:success] = 'Welcome to the myProjects!'
        redirect_to @user
      else
        render 'new'
      end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
   @user = User.find(params[:id])
   
   if @user.update_attributes(user_params)
     flash[:success] = "Profile updated"
     redirect_to @user
     #handle successful update
   else
     render 'edit'
   end
     
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_first_name, :user_last_name, :user_email, :user_nnumber, :password, :password_confirmation)
    end
    
    #Confirms a logged in user
    def logged_in_user
      unless logged_in?
      store location
      flash[:danger] = "Please log in."
      redirect_to login_url
      end
    end 
    
    #Confirms the correct user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
    
    
    
end
