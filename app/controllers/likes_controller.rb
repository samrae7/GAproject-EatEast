class LikesController < ApplicationController

  def new
    @business = Business.find(params[:business_id])
    @like = @business.likes.new
  end

  def create
    @business = Business.find(params[:business_id])

    #   redirect_to business_path(@business)
    # else
    #   puts 'failed'
    # end


        respond_to do |format|
     if @business.likes.create
          format.html { redirect_to @business, notice: 'User was successfully created.' }
        format.js   {}
        format.json { render json: @business, status: :created, location: @business }
      else
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # def like_params
  #   params.require(:like).permit(:business_id)
  # end

end
