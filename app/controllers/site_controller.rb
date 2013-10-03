class SiteController < ApplicationController

  def home
    #@project = Project.featured.first
    @projects = Project.all
  end

  def about

  end

  def terms

  end

  def privacy

  end
end
