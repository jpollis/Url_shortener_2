class UrlsController < ApplicationController
  before_action :set_url, only: [:edit, :update, :destroy, :show_full]

def index
  @urls = Url.all
end

def show
  url = Url.where(:random_id=>params[:id]).first
  if url
    redirect_to "http://#{url.name}"
  else
    redirect_to "index"
  end
end

def show_full
  redirect_to "http://#{@url.id}"
end
#
# def show_name
#   redirect_to "http://#{@url.name}"
# end

def new
  @url = Url.new

  letters = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
  @url.random_id = (0..4).map{ letters[rand(letters.length)] }.join
end

def edit
end

def create
  @url = Url.new(url_params)

  respond_to do |format|
    if @url.save
      format.html { redirect_to urls_path, notice: 'Url was successfully created.' }
      format.json { render :show, status: :created, location: @url }
    else
      format.html { render :new }
      format.json { render json: @url.errors, status: :unprocessable_entity }
    end
  end
end

def update
  respond_to do |format|
    if @url.update(url_params)
      format.html { redirect_to @url, notice: 'Url was successfully updated.' }
      format.json { render :show, status: :ok, location: @url }
    else
      format.html { render :edit }
      format.json { render json: @url.errors, status: :unprocessable_entity }
    end
  end
end

def destroy
  @url.destroy
  respond_to do |format|
    format.html { redirect_to urls_url, notice: 'Url was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private

  def set_url
    @url = Url.find(params[:id])
  end


  def url_params
    params.require(:url).permit(:name, :random_id)
  end
end
