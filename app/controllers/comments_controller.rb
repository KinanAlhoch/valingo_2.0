class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @object = params[:class_name].constantize.find(params[:object_id])
    @comment = Comment.build_from( @object, current_user.id, params[:comment][:body] )
    @comment.save
  end

  def see_more_comments
    @object = params[:class_name].constantize.find(params[:object_id])
    @comments =  @object.root_comments
  end
end
