require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build_stubbed(:user) }

  describe 'mass assignment' do
    context 'valid' do
      [:email, :password, :password_confirmation, :remember_me].each do |attribute|
        it { should allow_mass_assignment_of attribute }
      end
    end

    context 'invalid' do
      [:encrypted_password, :reset_password_token, 
       :reset_password_sent_at, :remember_created_at, 
       :sign_in_count, :current_sign_in_at, 
       :last_sign_in_at, :current_sign_in_ip, 
       :last_sign_in_ip, :created_at, :updated_at].each do |attribute|
         it { should_not allow_mass_assignment_of attribute }
       end
    end
  end

  it { user.should be_valid }

  it { should have_many(:entries).dependent(:destroy) }

end
