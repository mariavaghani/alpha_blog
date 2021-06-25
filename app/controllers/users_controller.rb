class UsersController < ApplicationController
  def new
    @page_name = 'Sign up for Alpha BLog'
    @user = User.new
  end

end
