class UsersController < ApplicationController
  before_action :set_user, only: %i[ show ]

  # GET /tweets/1 or /tweets/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @tweet = User.find(params[:id])
    end
end
