class SitesController < ApplicationController
  before_filter :require_login

  def index
    @sites = Site.all
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to sites_path, :notice => 'Site successfully created'
    else
      render :new
    end
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    if @site.update_attributes(site_params)
      redirect_to sites_path, :notice => 'Site updated successfully'
    else
      render :new
    end
  end

  private

    def site_params
      params.require(:site).permit(:endpoint, :frequency, :enabled)
    end
end
