# # frozen_string_literal: true
#
# require 'rails_helper'
#
# RSpec.describe Worklover::Firebase, focus: true do
#   describe 'self.service' do
#     it 'IdentityToolkitServiceのインスタンスが返ること' do
#       expect(described_class.service.class.name).to eq 'Google::Apis::IdentitytoolkitV3::IdentityToolkitService'
#     end
#   end
#
#   describe 'self.signup_new_user' do
#     let(:request_valid) do
#       Google::Apis::IdentitytoolkitV3::SignupNewUserRequest.new(
#         display_name: '中禅寺秋彦',
#         email: 'kyogokudo@example.com',
#         password: 'honeyasume'
#       )
#     end
#
#     let(:request_invalid_email) do
#       Google::Apis::IdentitytoolkitV3::SignupNewUserRequest.new(
#         display_name: '中禅寺秋彦',
#         email: 'invalid',
#         password: 'honeyasume'
#       )
#     end
#
#     let(:response_valid) do
#       Google::Apis::IdentitytoolkitV3::SignupNewUserResponse.new(
#         email: 'kyogokudo@example.com',
#         kind: 'identitytoolkit#SignupNewUserResponse',
#         local_id: 'kgyfsaDuNeexRVnIRyPEIzdBTIi1'
#       )
#     end
#
#     # let(:error_invalid_email) do
#     #   error = instance_double('Google::Apis::ClientError')
#     #   allow(error).to receive(:message).and_return('invalid: INVALID_EMAIL')
#     # end
#
#     before do
#       service = instance_double('Google::Apis::IdentitytoolkitV3::IdentityToolkitService')
#       authorization = instance_double('Google::Auth::ServiceAccountCredentials')
#       allow(service).to receive(:authorization=).and_return(authorization)
#       allow(service).to receive(:signup_new_user).with(:request_valid).and_return(response_valid)
#       allow(service).to receive(:signup_new_user).with(:request_invalid_email).and_raise(Google::Apis::ClientError, 'invalid: INVALID_EMAIL')
#       allow(Google::Apis::IdentitytoolkitV3::IdentityToolkitService).to receive(:new).and_return(service)
#     end
#
#     context '名前・有効なメールアドレス・6文字以上のパスワードが入力された場合' do
#       it 'サインアップが行われてレスポンスが返ること' do
#         expect(described_class.signup_new_user('中禅寺秋彦', 'kyogokudo@example.com', 'honeyasume')).to eq response_valid
#       end
#     end
#
#     context '無効なメールアドレスが入力された場合' do
#       it '例外が発生すること' do
#         expect { described_class.signup_new_user('中禅寺秋彦', 'invalid', 'honeyasume') }.to raise_error(Google::Apis::ClientError)
#       end
#     end
#   end
# end
