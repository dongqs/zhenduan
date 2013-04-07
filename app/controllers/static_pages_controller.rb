class StaticPagesController < ApplicationController
  def home
    if user_signed_in? && current_user.has_any_role?('admin', 'friend')
      @blogs = Blog.all
    else
      @blogs = Blog.find_by_status 'public'
    end
  end

  def about
  end
end
