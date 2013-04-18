class StaticPagesController < ApplicationController
  def home
    if current_user && current_user.has_any_role?(:admin, :friend)
      @blogs = Blog.where("status = ? or status = ?", 'public', 'limited').order(:created_at).reverse_order
    else
      @blogs = Blog.where("status = ?", 'public').order(:created_at).reverse_order
    end
  end

  def about
  end
end
