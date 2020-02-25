class DetailsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    
    @details = []
    @favorites = Favorite.where(user_id: current_user.id)
    
    if @favorites 
      @favorites.each do |favorite|
        @detail = Detail.find_by(favorite_id: favorite.id) 
        @details << @detail
      end
    end

  end
  
  def new
    @favorite = Favorite.find_by(id: params[:format])
    @item = Item.find_by(id: @favorite.item_id)
    @detail = Detail.new
  end  
  
  def create
    @favorite = Favorite.find_by(id: params[:favorite_id])
    @item = Item.find_by(id: @favorite.item_id)
    @detail = @favorite.build_detail(detail_params)
  
    if @favorite.user_id == current_user.id
      @detail.save
    end
    
    if @detail.save 
      flash[:success] = "4wを登録しました。"
      redirect_to item_path(@item)
    else
      flash.now[:danger] = "4wの登録に失敗しました。"
      render 'new'
    end
  end
  
  def edit
    @detail = Detail.find(params[:id])
  end
  
  def update
    @detail = Detail.find(params[:id])
    @favorite = Favorite.find_by(id: @detail.favorite_id)
    @item = Item.find_by(id: @favorite.item_id)
    
    
    if @detail.update(detail_params)
      flash[:success] = "4wの編集が完了しました。"
      redirect_to item_path(@item)
    else
      flash.now[:danger] = "4wの編集に失敗しました。"
      render 'edit'
    end
  end
  
  def destroy
    @detail = Detail.find(params[:id])
    
    @detail.destroy
    flash[:success] =  '4wを削除しました。'
    redirect_back(fallback_location: item_path(@detail))
  end
  
  private
  
  def detail_params
    params.require(:detail).permit(:favorite_id, :name, :purchase_date, :place, :person, :reason,  :way)
  end
end
