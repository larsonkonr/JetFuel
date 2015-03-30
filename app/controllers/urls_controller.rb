class UrlsController < ApplicationController
  def index
    @url = Url.new
    @urls = Url.all.sort { |b,a| a.usage <=> b.usage}
  end

  def create
    @url = Url.find_or_create_by(url_params)
    @url.title = fetch_title(@url.original_url)
    if @url.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show
    url = Url.where(shortened_url: params[:shortened_url]).first
    url.usage += 1
    url.save
    redirect_to url.original_url
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end

  def fetch_title(url)
    connection = Faraday.new(url: url)
    response = connection.get
    body = response.body
    body.match(/(?<=<title>).*(?=<\/title>)/)[0]
  end
end
