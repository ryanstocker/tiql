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

  end

  def update

  end

  private

    def site_params
      params.require(:site).permit(:endpoint, :frequency, :enabled)
    end
end
