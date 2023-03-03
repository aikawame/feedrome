# frozen_string_literal: true

require 'google/apis/identitytoolkit_v3'
require 'jwt'

# Firebaseサービスのラッパー
class Worklover::Firebase
  JSON_KEY = {
    client_email: Rails.application.credentials.firebase.client_email,
    private_key: Rails.application.credentials.firebase.private_key.gsub(/\\n/, "\n")
  }.to_json.freeze

  def self.service
    service = Google::Apis::IdentitytoolkitV3::IdentityToolkitService.new
    service.authorization = Google::Auth::ServiceAccountCredentials.make_creds(
      scope: 'https://www.googleapis.com/auth/identitytoolkit',
      json_key_io: StringIO.new(JSON_KEY)
    )
    service
  end

  def self.get_account_info(id_token)
    request = Google::Apis::IdentitytoolkitV3::GetAccountInfoRequest.new(
      id_token: id_token
    )
    service.get_account_info(request)&.users&.first
  end

  def self.delete_account(uid)
    request = Google::Apis::IdentitytoolkitV3::DeleteAccountRequest.new(
      local_id: uid
    )
    service.delete_account(request)
  end
end
