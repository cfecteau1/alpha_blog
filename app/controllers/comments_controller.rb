class CommentsController < ApplicationController
before_filter :authenticate, :only => [:create, :destroy]

def new
  @comment = Comment.new
end

def create
  @article = Article.find(params[:article_id])
  @comment = @article.comments.create(comment_params)
  @comment.user_id = if logged_in? 
  current_user.id
else
  current_user
end
  if @comment.save
    redirect_to @article
    flash[:success] = "Comment has been successfully created"
  elsif
    !logged_in?
    redirect_to @article
    flash[:danger] = "must be logged in to add comments"
  else
    redirect_to @article
    flash[:danger] = "Comment length must be 2 chars min. and 300 chars max."
  end
end


def destroy
end
private 
def authenticate
 if  !logged_in?
   flash[:danger] = "must be logged in to comment"
 end 
end
def comment_params
  params.require(:comment).permit(:user_id, :article_id, :comment)
end  

end