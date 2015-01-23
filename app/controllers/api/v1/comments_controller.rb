class Api::V1::CommentsController < Api::V1::BaseController
  
  before_filter :set_user_id, only: :create
  load_and_authorize_resource
  
  def set_user_id
    params[:user_id] = current_user.id
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :body, :article_id)
  end

end
