class CommentsController < ApplicationController

  def index
    @comment = Comment.order(:created_at).reverse_order
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to :back, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { redirect_to :back, notice: 'Failed.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
end
