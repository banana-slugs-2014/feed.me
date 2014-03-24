require 'spec_helper'

describe UsersController do
  let (:myuser){ FactoryGirl.create :user }
  let(:attribs){FactoryGirl.attributes_for :user_attribs}
  let(:invalid_attribs){FactoryGirl.attributes_for :user}
  let(:facebook_input){
{"id"=>"#{myuser.id}",
"name"=>"Johnny Wu",
"age_range"=>{"min"=>"21"},
"gender"=>"male",
"location"=>{"id"=>"109352265750998",
"name"=>"Medford,
Massachusetts"},
"likes"=>{"data"=>{"0"=>{"category"=>"Restaurant/cafe",
"category_list"=>{"0"=>{"id"=>"273819889375819",
"name"=>"Restaurant"}},
"name"=>"Pasilla Mexican Grill",
"created_time"=>"2014-03-21T02:50:44+0000",
"id"=>"550968254956947"},
"1"=>{"category"=>"Radio station",
"name"=>"THE VIBE GUIDE",
"created_time"=>"2014-03-18T08:22:10+0000",
"id"=>"112432268910463"}}},
"checkins"=>{"data"=>{"0"=>{"id"=>"10101453339452944",
"from"=>{"name"=>"Justin Wu",
"id"=>"6316063"},
"message"=>"Lunch with the cousins",
"place"=>{"id"=>"210074912348149",
"name"=>"Tasty Station",
"location"=>{"street"=>"19035 Colima Road",
"city"=>"Rowland Heights",
"state"=>"CA",
"country"=>"United States",
"zip"=>"91748",
"latitude"=>"33.987997151621",
"longitude"=>"-117.8879432865"}}}}},
"application"=>{"name"=>"Facebook for Windows Phone",
"id"=>"135892916448833"},
"created_time"=>"2012-08-12T19:19:46+0000",
"tags"=>{"data"=>{},
"paging"=>{"next"=>"https://graph.facebook.com/10101453339452944/tags?access_token=CAAJZBqlSmH7gBAN6C2JNGcZBCkBMjaPlGCJCEqPVPPeHrtcZCME0jsiwgDavP5XIJRX4K0QxZCjDANOIzdFtbZA2ZAZBPMSv1uUpKXXT2jZBZAdBIt6rtYLMZANvHZC3sPuENutqzlO3gW0ZCNwRaOuWtv5NJiMaXkMLxM8c963cUf8RKnWrubmiZCyqZAXT9k1XWWn1Azrim57bFzXQZDZD&limit=25&offset=25&__after_id=553728766"}}}
}
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

  context '#update' do
    context 'with full params (checkins, likes, age_range, location, gender, name)' do
      before(:each){myuser}

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
    end


  end
end