class YaksController < ApplicationController
  before_action :set_yak, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :correct_user?, only: [:edit, :update, :destroy]

  # GET /yaks
  # GET /yaks.json
  def index
    @yaks = Yak.all
  end

  # GET /yaks/1
  # GET /yaks/1.json
  def show
    redirect_to root_path
  end

  # GET /yaks/new
  def new
    @yak = Yak.new
  end

  # GET /yaks/1/edit
  def edit
  end

  def my_yaks
    @yaks = get_current_user.yaks.all
  end

  # POST /yaks
  # POST /yaks.json
  def create
    @yak = Yak.new(yak_params)
    @yak.score = 0
    @yak.user_id = get_current_user.id

    respond_to do |format|
      if @yak.save
        format.html { redirect_to @yak, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @yak }
      else
        format.html { render :new }
        format.json { render json: @yak.errors, status: :unprocessable_entity }
      end
    end
  end

  def upvote
    if get_current_user.liked? @yak
      @yak.unliked_by get_current_user
    else
      @yak.vote_by :voter => get_current_user, :vote => 'like'
    end

    redirect_to root_path
  end

  def downvote
    if get_current_user.disliked? @yak
      @yak.undisliked_by get_current_user
    else
      @yak.downvote_from get_current_user
    end

    redirect_to root_path
  end


  # PATCH/PUT /yaks/1
  # PATCH/PUT /yaks/1.json
  def update
    respond_to do |format|
      if @yak.update(yak_params)
        format.html { redirect_to @yak, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @yak }
      else
        format.html { render :edit }
        format.json { render json: @yak.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yaks/1
  # DELETE /yaks/1.json
  def destroy
    @yak.destroy
    respond_to do |format|
      format.html { redirect_to my_yaks_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yak
      @yak = Yak.find(params[:id])
    end

    def correct_user?
      if @yak.user_id != get_current_user.id
        redirect_to root_path, notice: 'You are not the owner of this post'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yak_params
      params.require(:yak).permit(:body)
    end
end
