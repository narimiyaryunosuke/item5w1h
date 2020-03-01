class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  def read(result)
    code = result['itemCode']
    name = result['itemName']
    price = result['itemPrice']
    url = result['itemUrl']
    image_url = result['mediumImageUrls'].first.gsub('?_ex=128x128', '')
    {code: code, name: name, price: price, url: url, image_url: image_url}
  end
  
end
