class UrlsController < ApplicationController
  def new 
    @short_url = nil
  end

  def create 
    url = Url.new(url_params)
    unless url.save
      return render json: {errors: url.errors.full_messages }, status: :unprocessable_entity
    end

    return render json: { short_url: short_url(url.short), original: url.original }, status: :created
  end

  def show 
    url = Url.find(params[:id])
    render json: { short_url: short_url(url.short), original: url.original }
  end

  def redirect 
    url = Url.find_by(short: params[:short])
    unless url 
      return render json: { error: "URL not found" }, status: :not_found
    end

    return redirect_to url.original, allow_other_host: true 
  end

  private 

  def url_params 
    params.require(:url).permit(:original)
  end

  def short_url(code)
    "#{request.base_url}/#{code}"
  end
end
