class UrlsController < ApplicationController
  def create 
    url = Url.new(url_params)
    if url.save 
      render json: { short_url: short_url(url.short), original: url.original }, status: :created
    else 
      render json: {errors: url.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show 
    url = Url.find(params[:id])
    render json: { short_url: short_url(url.short), original: url.original }
  end

  def redirect 
    url = Url.find_by(short: params[:short])
    if url 
      redirect_to url.original, allow_other_host: true 
    else
      render json: { error: "URL not found" }, status: :not_found
    end
  end

  private 

  def url_params 
    params.require(:url).permit(:original)
  end

  def short_url(code)
    "#{request.base_url}/#{code}"
  end
end
