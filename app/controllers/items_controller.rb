class ItemsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @items = []
    @keyword = params[:keyword]
    
    if @keyword
      results = RakutenWebService::Ichiba::Item.search({keyword: @keyword, imageFlag: 1, hits: 20})
     
      results.each do |result|
        @item = Item.find_or_initialize_by(read(result))
        @items << @item
      end
      
    end
    
  end
  
  def show
    @item = Item.find(params[:id])
    @favorite = Favorite.find_by(user_id: current_user.id, item_id: @item.id)
    @detail = Detail.find_by(favorite_id: @favorite.id)
  end
  
end
