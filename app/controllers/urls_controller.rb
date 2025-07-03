class UrlsController < ApplicationController
  def index 
    @short_url = nil
    render :index
  end

  def create 
    url = Url.new(url_params)
    if url.save 
      @short_url = short_url(url.short)
      return render :index 
    end

    @short_url = nil 
    flash.now[:alert] = url.errors.full_messages.join(', ')
    render :index, status: :unprocessable_entity
  end

  def show 
    url = Url.find(params[:id])
    render json: { short_url: short_url(url.short), original: url.original }
  end

  def redirect 
    url = Url.find_by(short: params[:short])

    if url.present?
      return redirect_to url.original, allow_other_host: true
    end

    render json: { error: "URL not found" }, status: :not_found
  end

  private 

  def url_params 
    params.require(:url).permit(:original)
  end

  def short_url(code)
    "#{request.base_url}/#{code}"
  end
end
