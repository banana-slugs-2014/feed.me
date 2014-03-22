require 'spec_helper'

describe SessionsController do
  let (:myuser){ FactoryGirl.create :user }
  let(:attribs){FactoryGirl.attributes_for :user_attribs}
  let(:invalid_attribs){FactoryGirl.attributes_for :user}
  context '#create' do
    context 'with a new user' do
      context "with valid params" do
        before(:each){post :create, authResponse: attribs}
        it {expect(response).to be_redirect}

        it "should increase the User count" do
          expect(User.count).to eq 1
        end

        it "should set the session hash" do
          expect(session[:user_id]).to eq attribs[:userID]
        end
      end

      context "with invalid params" do
        before(:each){post :create, authResponse: invalid_attribs}
        it {expect(response).to be_redirect}

        it "should increase the User count" do
          expect(User.count).to eq 0
        end

        it "should set the session hash" do
          expect(session[:user_id]).to be_nil
        end
      end
    end

    context 'with a previous user' do
      context 'with valid params' do

        it "should be redirect" do
        expect(
          post :create, authResponse: {userID: myuser.uid, accessToken: myuser.oauth_token}
          ).to be_redirect
        end

        it "should not increase the User count" do
          myuser

          expect{
          post :create, authResponse: {userID: myuser.uid, accessToken: myuser.oauth_token}
          }.to_not change{User.count}
        end

        it "should set the session hash" do
          post :create, authResponse: {userID: myuser.uid, accessToken: myuser.oauth_token}
          expect(session[:user_id]).to eq myuser.uid
        end
      end
    end
  end
end