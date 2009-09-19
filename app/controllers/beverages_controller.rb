class BeveragesController < ApplicationController
  
  rescue_from ActiveRecord::RecordInvalid do |e|
    redirect_to beverages_path
  end
  
  def index
    @beverages = Beverage.all
  end
  
  def alcoholic
    @beverages = Beverage.alcoholic
    render :action => :index
  end
  
  def new
  end
  
  def show
  end
  
  def edit
  end
  
  def create
    @beverage = Beverage.create! params[:beverage]  # { :name => 'Whatever' }
    redirect_to beverage_path(@beverage)
  end
  
  def update
    current_beverage.update_attributes params[:beverage]
    redirect_to beverage_path(@beverage)
  end

  def destroy
    Beverage.delete(params[:id])
    redirect_to beverages_path
  end
  
  
  private
  
  def current_beverage
    @beverage ||= Beverage.find_by_id(params[:id]) || Beverage.new
  end
  helper_method :current_beverage

end
