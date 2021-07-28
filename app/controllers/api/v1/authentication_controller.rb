module Api
  module V1
    class AuthenticationController < ApplicationController
      class AuthenticationError < StandardError; end
      rescue_from ActionController::ParameterMissing, with: :parameter_missing
      rescue_from AuthenticationError, with: :handle_unauthenticated

      def create
        if user
          raise AuthenticationError unless user.authenticate(params.require(:password))

          token = AuthenticationTokenService.encode(user.id)

          render json: { token: token, email: user.email, username: user.username, admin: user.admin }, status: :ok
        else
          render json: { status: '400' }, status: :bad_request
        end
      end

      private

      def user
        @user ||= User.find_by(email: params.require(:email))
      end

      def parameter_missing(error)
        render json: { error: error.message }, status: :unprocessable_entity
      end

      def handle_unauthenticated
        head :unauthorized
      end
    end
  end
end
