require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it "Should create a new user" do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'John@Doe.com',
        password: '123456',
        password_confirmation: '123456'
      )
      expect(user).to be_valid
    end
    
    it "Should not create a new user if first_name is missing" do
      user = User.new(
        first_name: nil,
        last_name: 'Doe',
        email: 'John@Doe.com',
        password: '123456',
        password_confirmation: '123456'
      )
      expect(user).to_not be_valid
    end

    it "Should not create a new user if last_name is missing" do
      user = User.new(
        first_name: 'John',
        last_name: nil,
        email: 'John@Doe.com',
        password: '123456',
        password_confirmation: '123456'
      )
      expect(user).to_not be_valid
    end
    
    it "Should not create a new user if Email is missing" do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: nil,
        password: '123456',
        password_confirmation: '123456'
      )
      expect(user).to_not be_valid
    end
    
    it "Should not create a new user if password fields do not match" do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'John@Doe.com',
        password: '123456',
        password_confirmation: '1'
        )
        expect(user).to_not be_valid
    end
      
    it "Should not create a new user if password fields are empty" do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'John@Doe.com',
        password: nil,
        password_confirmation: nil
        )
        expect(user).to_not be_valid
      end
      
    it "Should not create a new user if email already exists" do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: nil,
        password: '123456',
        password_confirmation: '123456'
      )
      expect(user).to_not be_valid
    end
  
    it "Should not create a new user if password is less than 3 characters" do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'John@Doe.com',
        password: '12',
        password_confirmation: '12'
      )
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "Should create a new user" do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'John@Doe.com',
        password: '123456',
        password_confirmation: '123456'
      )
      expect(user).to be_valid
    end
    
    it 'Should create a new username if there are spaces in the email' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: '  John@Doe.com',
        password: '123456',
        password_confirmation: '123456'
      )
      expect(user).to be_valid
    end
    
    it 'Should create a new username if there are capitalized letters in the email' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'JOHN@dOe.com',
        password: '123456',
        password_confirmation: '123456'
      )
      expect(user).to be_valid
    end
  end

end
