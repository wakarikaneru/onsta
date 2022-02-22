class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]

  # GET /tweets or /tweets.json
  def index
    @tweet = Tweet.new

    @tweets = Tweet.where(parent_id: nil).order(id: :desc).page(params[:page]).per(20)
  end

  # GET /tweets/1 or /tweets/1.json
  def show
    @tweet.increment!(:tirami_count, 1)
    @res = Tweet.new

    @reses = Tweet.where(parent_id: @tweet.id).order(id: :asc).page(params[:page]).per(20)
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
    if current_user.id != @tweet.user_id
      redirect_to tweets_path
    end
  end

  # POST /tweets or /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)

    @tweet.user_id = 0
    @tweet.kakikomi_id_mana = session[:kakikomi_id_mana]
    @tweet.kakikomi_id_disp = session[:kakikomi_id_disp]
    @tweet.ip_addr = request.remote_ip


    if @tweet.parent.nil?
      if @tweet.image.attached?
      else
        redirect_to tweets_path, alert: "画像が無効です。"
        return
      end
    end

    if @tweet.save
      if @tweet.parent.present?
        @tweet.parent.increment!(:res_count, 1)
        redirect_to @tweet.parent
      else
        redirect_to tweets_path
      end
    else
      redirect_to tweets_path
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    if current_user.id != @tweet.user_id
      redirect_to tweets_path
    end

    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: "Tweet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    if current_user.id != @tweet.user_id
      redirect_to tweets_path
    end

    @tweet.image.purge if @tweet.image.attached?
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:user_id, :content, :image, :parent_id)
    end
end
