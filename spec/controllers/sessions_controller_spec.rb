require 'spec_helper'

describe SessionsController do
  let (:myuser){ FactoryGirl.create :user }

  context '#destroy' do
    before(:each) do
      session[:user_id] = myuser.uid
      delete :destroy, id: myuser.uid
    end

    it {expect(response).to be_redirect}
    it {should set_session(:user_id).to nil}
  end
end