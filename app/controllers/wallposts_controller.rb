class WallpostsController < ApplicationController
  before_action :signed_in_user

  # GET /wallposts
  # GET /wallposts.json
  def index
    @wallposts = Wallpost.all
  end

  # GET /wallposts/1
  # GET /wallposts/1.json
  def show
  end

  # GET /wallposts/new
  def new
    @wallpost = Wallpost.new
  end

  # GET /wallposts/1/edit
  def edit
  end

  # POST /wallposts
  # POST /wallposts.json
  def create
    @posted = User.find(params[:wallpost][:posted_id])
    
    @post = @posted.posts.create!(:poster => current_user, :content=>
                       params[:wallpost][:content], :posted => @posted)
    if @post.save
      flash[:success] = "Wallpost created!"
      redirect_to user_path(@posted)
    else
      flash[:failure] = @post.errors
      redirect_to root_url
    end

  end

  # PATCH/PUT /wallposts/1
  # PATCH/PUT /wallposts/1.json
  def update
    respond_to do |format|
      if @wallpost.update(wallpost_params)
        format.html { redirect_to @wallpost, notice: 'Wallpost was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wallpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wallposts/1
  # DELETE /wallposts/1.json
  def destroy
    @post = Post.find(params[:id])
    #@wallpost.destroy
    @post.destroy
    flash[:notice] = "Post has been deleted"
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private
    def wallpost_params
      params.require(:wallpost).permit(:content, :posted_id)
    end
  
 def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      @wallpost = current_user.wallposts.find_by(id: params[:id])
      redirect_to root_url if @wallpost.nil?
    end
end
