class FriendshipsController < ApplicationController
  #before_action :set_friendship, only: [:show, :edit, :update, :destroy]
  before_filter :setup_friends

  def create
    Friendship.request(@user,@friend)
    flash[:notice] = "Friend request sent."
    redirect_to url_for(@friend)
  end
  
  def destroy
    if current_user.requested_friends.include?(@user)
      Friendship.breakup(current_user, @user)
      flash[:notice] = "Removed friendship."
    elsif current_user.pending_friends.include?(@user)
      Friendship.breakup(current_user, @user)
      flash[:notice] = "Removed friendship."
    elsif current_user.friends.include?(@user)
      Friendship.breakup(current_user, @user)
      flash[:notice] = "Removed friendship."
    else
      flash[:notice] = "Not friends with this user"
    end
    #@friendship = current_user.friendships.find(params[:id])
    #@friendship.destroy
    
    redirect_to current_user
  end
  # GET /friendships
  # GET /friendships.json
  #def index
   # @user = User.find(current_user.id)
    #@friend = User.find(params[:id])
    #Friendship.request(@user,@friend)
    #flash[:notice] = "Friend request sent."
    #redirect_to url_for(@friend)
  #end
  #def index
   # @friendships = Friendship.all
  #end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
  end

 def setup_friends
    @user = User.find(current_user.id)
    @friend = User.find(params[:id])
  end

  def accept
    @user = User.find(current_user.id)
    @friend = User.find(params[:id])
    if @user.requested_friends.include?(@friend)
      Friendship.accept(@user, @friend)
      flash[:notice] = "You have accepted #{@friend.name}'s friend request."
    else
      flash[:notice] = "No friendship request from #{@friend.name}."
    end
    redirect_to root_path
  end

  

 # def update
   # respond_to do |format|
     # if @friendship.update(friendship_params)
      #  format.html { redirect_to @friendship, notice: 'Friendship was successfully updated.' }
       # format.json { head :no_content }
      #else
       # format.html { render action: 'edit' }
        #format.json { render json: @friendship.errors, status: :unprocessable_entity }
      #end
    #end
  #end
 # POST /friendships
  # POST /friendships.json
 #def create
 # @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
  #if @friendship.save
   # flash[:notice] = "Added friend."
    #redirect_to root_url
  #else
   # flash[:error] = "Unable to add friend."
    #redirect_to root_url
  #end
#end


  private
    #Use callbacks to share common setup or constraints between actions.
    #def set_friendship
     # @friendship = Friendship.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :create, :destroy)
    end
end
