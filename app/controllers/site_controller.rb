class SiteController < ApplicationController

  def home
    @project = Project.featured.first
  end

  def about

  end

  def terms

  end

  def privacy

  end
end
