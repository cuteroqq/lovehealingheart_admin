class MainsController < ApplicationController
  def index
    @mains = Event.where("public_date <= ?", Time.now)
  end
  
  def show
    @main = Event.find(params[:id])
  end  
  
  def origin
  end
  
  def service
  end
  
  def publ_index
    @mains = Event.where("cnttype = ?", 1)
  end
  
  def publ_content
    @main = Event.find(params[:id])
  end
  
  def case_index
    @mains = Event.where("cnttype = ?", 2)
  end
  
  def case_content
    @main = Event.find(params[:id])
  end
end
