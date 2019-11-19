class AccountController < ApplicationController
	before_action :require_authentication
	before_action :store_return_to

	def index
	@usuario = current_user	
	end
end