class MessagesController < ApplicationController
  # GET /messages/new?with=2
  def new
    # Left panel
    @all_senders = current_user.received_or_sent_message_users
    @messages = Message.where(sent_user_id: current_user.id,
                              received_user_id: params[:with])
    @sender = User.find(params[:with])
  end

  # POST /messages
  def create
    @message = Message.new(message_params)

    if @message.save
      flash[:success] = '送信されました'
      redirect_to :back
    else
      flash[:warning] = 'メッセージを入力して下さい'
      redirect_to :back
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:sent_user_id, :received_user_id, :message)
    end
end
