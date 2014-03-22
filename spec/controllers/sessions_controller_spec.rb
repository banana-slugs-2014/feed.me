require 'spec_helper'

describe SessionsController do
  let (:myuser){ FactoryGirl.create :user }
  let(:attribs){FactoryGirl.attributes_for :user_attribs}
  let(:invalid_attribs){FactoryGirl.attributes_for :user}
  context '#create' do
    context 'with a new user' do
      context "with valid params" do
        before(:each){post :create, authResponse: attribs}
        it {expect(response).should render_template(partial: "places/_index")}

        it "should increase the User count" do
          expect(User.count).to eq 1
        end

        it {should set_session(:user_id).to attribs[:userID]}
      end

      context "with invalid params" do
        before(:each){post :create, authResponse: invalid_attribs}
        it  "should render template partial places/_index" do
          response.should render_template(partial: "places/_index")
        end
        it "should increase the User count" do
          expect(User.count).to eq 0
        end

        it {should set_session(:user_id).to nil}
      end
    end

    context 'with a previous user' do
      context 'with valid params' do

        it "should be a render template places/_index" do
          post :create, authResponse: {userID: myuser.uid, accessToken: myuser.oauth_token}
          expect(response).should render_template(partial: "places/_index")
        end

        it "should not increase the User count" do
          myuser
          expect{
          post :create, authResponse: {userID: myuser.uid, accessToken: myuser.oauth_token}
          }.to_not change{User.count}
        end

        it "should set the session hash" do
          post :create, authResponse: {userID: myuser.uid, accessToken: myuser.oauth_token}
          should set_session(:user_id).to myuser.uid
        end
      end
    end
  end

  context '#destroy' do
    before(:each) do
      session[:user_id] = myuser.uid
      delete :destroy, id: myuser.uid
    end

    it {expect(response).to be_redirect}
    it {should set_session(:user_id).to nil}
  end
end