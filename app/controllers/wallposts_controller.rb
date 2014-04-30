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
    @postee = User.find(params[:wallpost][:id])
    @wallpost = @postee.wallposts.build(wallpost_params)
    if @wallpost.save
      flash[:success] = "Wallpost created!"
      redirect_to user_path(current_use)
    else
      flash[:failure] = @wallpost.errors
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
    @wallpost.destroy
    respond_to do |format|
      format.html { redirect_to wallposts_url }
      format.json { head :no_content }
    end
  end

  private
    def wallpost_params
      params.require(:wallpost).permit(:content)
    end
  
 def correct_user
      @wallpost = current_user.wallposts.find_by(id: params[:id])
      redirect_to root_url if @wallpost.nil?
    end
end
