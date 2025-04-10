class MessagesController < ApplicationController
  def index
    @messages = Message.all.order(created_at: :desc)
    # 全メッセージを作成日時の降順（新しい順）で取得
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path, notice: "メッセージを投稿しました。"
    else
      flash.now[:alert] = "メッセージの投稿に失敗しました。"
      render :new
    end
  end

  private

  def message_params
    # Strong Parameters
    params.require(:message).permit(:content)
  end
end
