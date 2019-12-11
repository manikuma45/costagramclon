class MessageMailer < ApplicationMailer
	def message_mail(message)
		@message = message

		mail to: "manikuma0405@gmail.com", subject: "投稿内容の確認"
	end
end
