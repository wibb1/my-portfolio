class TopicsController < ApplicationController
  before_action :set_topic, only: [:edit, :update, :show, :destroy]
  layout "blog"
  access all: [:show, :index], user: {except: [:destroy, :new, :update, :edit]}, site_admin: :all

  def new
    @topic = Topic.new
  end

  def edit

  end

  def show
    @topic = Topic.find(params[:id])
  end

  def index
    @topics = Topic.all
  end

  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
