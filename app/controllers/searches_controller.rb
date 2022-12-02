class SearchesController < ApplicationController
  def index
    flickr_key = Figaro.env.flickr_key
    if params[:user_id] == ""
      flickr_url = "https://www.flickr.com/services/rest/?method=flickr.people.getPublicPhotos&api_key=#{flickr_key}&user_id=143440097%40N07&format=json&nojsoncallback=1"
    else
      flickr_url = "https://www.flickr.com/services/rest/?method=flickr.people.getPublicPhotos&api_key=#{flickr_key}&user_id=#{params[:user_id]}&format=json&nojsoncallback=1"
    end
    response = RestClient.get(flickr_url)
    response_object = JSON.parse(response)
    photos_meta_data_array = response_object["photos"]["photo"]
    @photo_url_array = photos_meta_data_array.map do |photo_data|
      "http://farm#{photo_data["farm"]}.staticflickr.com/#{photo_data["server"]}/#{photo_data["id"]}_#{photo_data["secret"]}.jpg"
    end
    p @photo_url_array
    #photo_url = "http://farm#{farm_id}.staticflickr.com/#{server_id}/#{id}_#{secret}.jpg"
  end
end
