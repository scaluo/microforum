class RepliesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @topic = Topic.find(params[:topic_id])
    @reply = @topic.replies.build(params[:reply])
    @reply.user = current_user
    if @reply.save
      redirect_to topic_path(@topic)
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
	  @reply=@topic.replies.find(params[:id])
  	@reply.destroy
	  redirect_to topic_path(@topic)
  end
end
