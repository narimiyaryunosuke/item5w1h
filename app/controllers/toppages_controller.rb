class ToppagesController < ApplicationController
  
  def index
    @items = Item.page(params[:page]).per(9).order('updated_at DESC')
  end
  
end
