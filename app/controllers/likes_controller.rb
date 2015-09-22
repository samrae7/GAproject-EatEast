class LikesController < ApplicationController

  def new
    @business = Business.find(params[:business_id])
    @like = @business.likes.new
  end

  def create
    @business = Business.find(params[:business_id])
    if @business.likes.create
      redirect_to businesses_path
    else
      puts 'failed'
    end
  end

  # def like_params
  #   params.require(:like).permit(:business_id)
  # end

end
