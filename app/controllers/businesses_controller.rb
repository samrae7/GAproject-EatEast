class BusinessesController < ApplicationController

  # if you don't have any logic on the index action you don't need it. The view will still show. In this case we don't need the logic because the before_action is getting @businesses for us 


  def index
    @businesses =  Business.all.order(updated_at: :desc)
  end

  def new
    @business = Business.new
  end

  def show
    @business = Business.find(params[:id])
  end

  def create
    @business = Business.new(business_params)
    @businesses =  Business.all.order(updated_at: :desc)
   
    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'User was successfully created.' }
        format.js   {}
        format.json { render json: @business, status: :created, location: @business }
      else
        format.html { render action: "new" }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @business = Business.find(params[:id])
  end

  def update
    @business = Business.find(params[:id])
    @businesses =  Business.all.order(updated_at: :desc)

    respond_to do |format|

      if @business.update(business_params)
        format.js   {}
      else
        render :edit
      end
    end

  end

  def destroy
     @business = Business.find(params[:id]).destroy
     @businesses =  Business.all.order(updated_at: :desc)
     # redirect_to '/', status: 303
     respond_to do |format|
        format.js   {}
     end
  end

  private

  def business_params
    params.require(:business).permit(:name, :city, :display_phone, :address1, :address2, :address3, :post_code, :latitude, :longitude, :categories, :yelp_id, :veg_friendly, :cuisine, :drinks, :coffee, :food, :takeaway, :delivers)
  end

end
