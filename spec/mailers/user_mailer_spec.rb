require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let!(:user) { create(:user) }
  let(:mail) { described_class.with(user: user).welcome_email.deliver_now }

  it "renders the headers" do
    expect(mail.to).to eq([user.email])
  end
end
