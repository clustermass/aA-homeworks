class BandsController < ApplicationController


  def index
    @all_bands = Band.all
  end


  def create
    band = Band.new(name: params[:band][:name])
    if band.save!
      redirect_to bands_url
    else
      redirect_to :create
    end
  end

  def new
    render :new
  end

  def edit
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def update
  end

  def destroy
    band = Band.find_by(id: params[:id])
    band.destroy
    redirect_to bands_url
  end

end
