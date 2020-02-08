class ItemsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @items = []
    
    @keyword = params[:keyword]
    
    if @keyword
      results = RakutenWebService::Ichiba::Item.search({keyword: @keyword, imageFlag: 1, hits: 20})
     
      results.each do |result|
        item = Item.new(read(result))
        @items << item
      end
    end
  end
  
  private
  
  def read(result)
    code = result['itemCode']
    name = result['itemName']
    price = result['itemPrice']
    url = result['itemUrl']
    image_url = result['mediumImageUrls'].first.gsub('?_ex=128x128', '')
    {code: code, name: name, price: price, url: url, image_url: image_url}
  end
end
