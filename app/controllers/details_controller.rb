class DetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_detail, only: [:edit, :update, :destroy]
  
  def index
    @details = []
    @favorites = Favorite.where(user_id: current_user.id)
    
    if @favorites 
      @favorites.each do |favorite|
        @detail = Detail.find_by(favorite_id: favorite.id) 
        @details << @detail
      end
    end
    
    @exist_details = @details.compact
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
  end
  
  def update
    @favorite = Favorite.find_by(id: @detail.favorite_id)
    @item = Item.find_by(id: @favorite.item_id)
    
    if @detail.update(detail_params)
      flash[:success] = "5w1hの編集が完了しました。"
      redirect_to item_path(@item)
    else
      flash.now[:danger] = "5w1hの編集に失敗しました。"
      render 'edit'
    end
    
  end
  
  def destroy
    @detail.destroy
    flash[:success] =  '5w1hを削除しました。'
    redirect_back(fallback_location: item_path(@detail))
  end
  
  private
  
  def set_detail
    @detail = Detail.find(params[:id])
  end
  
  def detail_params
    params.require(:detail).permit(:favorite_id, :name, :purchase_date, :place, :person, :reason,  :way)
  end
  
end
