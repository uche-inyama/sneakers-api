class Admins::AccountsController < ApplicationController
  before_action :authenticate_admin!

  def index
  end

  def create
    @account = Account.find_or_create_by(admin: current_admin)
    service = StripeAccount.new(@account)
    service.create_account
    redirect_to service.onboarding_url, allow_other_host: true, status: :see_other
  end
end