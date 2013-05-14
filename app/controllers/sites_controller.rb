class SitesController < ApplicationController
  before_filter :require_login

  def index
    @sites = Site.all
  end
end
