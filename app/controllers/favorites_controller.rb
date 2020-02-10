class FavoritesController < ApplicationController
  def create
    @item = Item.find_or_initialize_by(code: params[:item_code])
    
    unless @item.persisted?
      results = RakutenWebService::Ichiba::Item.search(itemCode: @item.code)

      @item = Item.new(read(results.first))
      @item.save
    end
    
    current_user.fav(@item)
    flash[:success] = "お気に入り登録しました。"
    
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @item = Item.find(params[:item_id])
    
    current_user.unfav(@item)
    
    flash[:success] = "お気に入り登録を解除しました。"
    
    redirect_back(fallback_location: root_path)
  end
end
