class MessagesController < ApplicationController
   before_action :authenticate_user!

  def index
    @messages = current_user.received_messages.conversations
  end

  def new
    @user = User.find(params[:user_id])
  end

  def send_message
    @user = User.find(params[:user_id])
    @message = current_user.send_message(@user,params[:subject], params[:body])
   
    flash[:notice]= "Your message has been send to #{@user.name}"
    redirect_to root_path
  end

  def reply_message
    @message = Message.find(params[:id])
  end

  def reply
    @message = Message.find(params[:message_id])
    @user = User.find(@message.sent_messageable_id)
    @reply_message = current_user.reply_to(@message, "Re: #{@message.topic}", params[:body])

    flash[:notice]= "Message Sent!"
    redirect_to conversation_message_path(@reply_message)
  end

  def conversation
    @message = Message.find(params[:id])
    @messages = @message.conversation
  end

  def sent_messages
    @messages = current_user.sent_messages
  end
end
