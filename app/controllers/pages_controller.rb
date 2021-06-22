class PagesController < ApplicationController
  def home

  end

  def about
    @page_name = 'About'
  end
end
