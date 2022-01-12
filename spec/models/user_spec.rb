require 'rails_helper'

RSpec.describe User, type: :model do

  context 'check if the passwords match' do
    user = User.new(email: 'test@test.com', password: 'BestPasswordEver', password_confirmation: 'BestPasswordEver')
    user.valid?
    it 'checks if the passwords match' do
      expect(user.errors[:password_confirmation]).not_to be_present
    end
  end

  context "check if password don't match" do
    user = User.new(email: 'test@test.com', password: 'BestPasswordEver', password_confirmation: 'BestPassword')
    user.valid?
    it "checks if the password doesn't match" do
      expect(user.errors[:password_confirmation]).to be_present
    end
  end

  it 'should have an email that has not been registered yet' do
    user = User.new(email: 'test@test.com', password: 'BestPasswordEver', password_confirmation: 'BestPasswordEver')
    user.save

    another_user = User.new(email: 'test@test.com', password: 'BestPasswordEver', password_confirmation: 'BestPasswordEver')
    another_user.save

    expect(u.errors[:email].first).to eq('the email has already been registered')
  end

  it 'check if the password length less than 5 characters' do
    user = User.new(email: 'test@test.com', password: 'poop')

    result = user.save

    expect(result).to be(false)
  end

  it 'checks if password length is at-least 5 characters' do
    user = User.new(email: 'test@test.com', password: 'poopie')

    result = user.save

    expect(result).to be(true)
  end
end
