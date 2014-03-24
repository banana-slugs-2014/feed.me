require 'spec_helper'
require_relative 'facebook_update_stub'

describe UsersController do
  let(:myuser){ FactoryGirl.create :user }
  let(:attribs){FactoryGirl.attributes_for :user_attribs}
  let(:invalid_attribs){FactoryGirl.attributes_for :user}
  let(:facebook_input){FACEBOOK_UPDATE_INFO}

  context '#create' do
    context 'with a new user' do
      context "with valid params" do
        before(:each){post :create, authResponse: attribs}
        it {expect(response).to be_ok}

        #THIS IS A JANKY TEST: consider removing? -PhilV
        it {expect(response.body).to eq [id: User.first.id].first.to_json}

        it "should increase the User count" do
          expect(User.count).to eq 1
        end

        it {should set_session(:user_id).to attribs[:userID]}
      end

      context "with invalid params" do
        before(:each){post :create, authResponse: invalid_attribs}
        it  "should render template partial places/_index" do
          expect(response).to be_redirect
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
          expect(response).to render_template(partial: "places/_index")
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

  context '#update' do
    context 'with full params (checkins, likes, age_range, location, gender, name)' do
      before(:each){myuser}

      it {expect(put :update, facebook_input).to be_ok}
      it {expect(put :update, facebook_input).to render_template partial: 'places/_index'}
      it "should increase the checkins count" do
        expect{put :update, facebook_input}.to change{Checkin.count}
      end

      it "should increase the likes count" do
        expect{put :update, facebook_input}.to change{UserLike.count}
      end

      it "should change user.age_range" do
        expect{put :update, facebook_input}.to change{myuser.reload.age_range}.to facebook_input["age_range"]["min"].to_i
      end

      it "should change user.gender" do
        expect{put :update, facebook_input}.to change{myuser.reload.gender}.to facebook_input["gender"]
      end

      it "should change user.location" do
        expect{put :update, facebook_input}.to change{myuser.reload.location}.to facebook_input["location"]["name"]
      end

      it "should change user.name" do
        expect{put :update, facebook_input}.to change{myuser.reload.name}.to facebook_input["name"]
      end
    end

    context 'with minimal params (name)' do
      before(:each){myuser}
      let(:min_attribs){{"id"=>"#{myuser.id}","name"=>"Bill Murray"}}

      it {expect(put :update, min_attribs).to be_ok}
      it {expect(put :update, min_attribs).to render_template partial: 'places/_index'}

      it "should change user.name" do
        expect{put :update, min_attribs}.to change{myuser.reload.name}.to min_attribs["name"]
      end

      it "should not increase the checkins count" do
        expect{put :update, min_attribs}.to_not change{Checkin.count}
      end

      it "should not increase the likes count" do
        expect{put :update, min_attribs}.to_not change{UserLike.count}
      end

      it "should not change user.age_range" do
        expect{put :update, min_attribs}.to_not change{myuser.reload.age_range}
      end

      it "should not change user.gender" do
        expect{put :update, min_attribs}.to_not change{myuser.reload.gender}
      end

      it "should not change user.location" do
        expect{put :update, min_attribs}.to_not change{myuser.reload.location}
      end
    end

  end
end