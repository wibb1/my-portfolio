class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  layout 'portfolio'
  access all: [:show, :index, :angular, :rails], user: {except: [:destroy, :new, :update, :edit, :sort]}, site_admin: :all

  def index
    @portfolio_items = Portfolio.by_position
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    head :ok
  end


  def angular
    @angular_items = Portfolio.angular
  end

  def rails
    @rails_items = Portfolio.rails
  end

  def show
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: "Portfolio successfully amended." }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
     respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: "Portfolio has been updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @portfolio_item.destroy

    respond_to do |format| 
      format.html { redirect_to portfolios_path, notice: "Porfolio item was removed" }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :blurb,
                                      :body,
                                      :main_image,
                                      :thumb_image, 
                                      :github_link, 
                                      :deployed_link,
                                      technologies_attributes: [:id, :name, :_destroy]
                                    )
  end
  
  def set_portfolio_item 
    @portfolio_item = Portfolio.find(params[:id])
  end
end

