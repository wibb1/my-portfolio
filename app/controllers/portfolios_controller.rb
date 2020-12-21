class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  layout 'portfolio'
  access all: [:show, :index, :angular, :rails], user: {except: [:destroy, :new, :update, :edit]}, site_admin: :all

  def index
    @portfolio_items = Portfolio.by_position
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
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: "Your portfolio item is now live." }
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
        format.html { redirect_to portfolios_path, notice: "Your portfolio item has been updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @portfolio_item.destroy

    respond_to do |format| 
      format.html { redirect_to portfolios_path, notice: "Porfolio was removed" }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name]
                                    )
  end
  
  def set_portfolio_item 
    @portfolio_item = Portfolio.find(params[:id])
  end
end

