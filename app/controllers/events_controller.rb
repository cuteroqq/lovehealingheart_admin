class EventsController < ApplicationController
  before_action :set_event, :only => [ :show, :edit, :update, :destroy]
  def index
    #@events = Event.all
    @events = Event.page(params[:page]).per(5)
  end
  
  def new
    @event = Event.new
  end
  def create
    @event = Event.new(event_params)
    if @event.save
      #redirect_to :action => :index
      redirect_to events_url
    else
      render :action => :new
    end
    flash[:notice] = "event was successfully created"
  end
  
  def show
    #@event = Event.find(params[:id])
    @page_title = @event.title
  end
  
  def edit
    #@event = Event.find(params[:id])
  end
  def update
    #@event = Event.find(params[:id])
    if @event.update(event_params)
      #redirect_to :action => :show, :id => @event
      redirect_to event_url(@event)
    else
      render :action => :edit
    end
    flash[:notice] = "event was successfully updated"
  end
  
  def destroy
    #@event = Event.find(params[:id])
    @event.destroy
  
    #redirect_to :action => :index
    redirect_to events_url
    flash[:alert] = "event was successfully deleted"
  end
  
  #private以下的所有方法都會變成private方法，所以記得放在檔案的最底下。
  private
  
  def event_params
    params.require(:event).permit(:cnttype, :description, :author, :is_public, :public_date,
    :category_ids => [])
  end
  
  def set_event
    @event = Event.find(params[:id])
  end
end
