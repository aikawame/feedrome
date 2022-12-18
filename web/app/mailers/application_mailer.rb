# frozen_string_literal: true

# 基底メーラー
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
