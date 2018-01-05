require 'spec_helper'

describe Api::V1::TripsController do

  describe "GET #show" do
    before(:each) do
      @trip = FactoryGirl.create :trip
      get :show, id: @trip.id
    end

    it "returns the information about a reporter on a hash" do
      trip_response = json_response
      expect(trip_response[:title]).to eql @trip.title
    end

    it { should respond_with 200 }
  end

  describe "GET #index" do
    before(:each) do
      4.times { FactoryGirl.create :trip }
      get :index
    end

    it "returns 4 records from the database" do
      trips_response = json_response
      expect(trips_response).to have(4).items
    end

    it { should respond_with 200 }
  end

  describe "POST #create" do
    context "when is successfully created" do
      before(:each) do
        user = FactoryGirl.create :user
        @trip_attributes = FactoryGirl.attributes_for :trip
        api_authorization_header user.auth_token
        post :create, { user_id: user.id, trip: @trip_attributes }
      end

      it "renders the json representation for the trip record just created" do
        trip_response = json_response
        expect(trip_response[:title]).to eql @trip_attributes[:title]
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        user = FactoryGirl.create :user
        @invalid_trip_attributes = { title: "Smart TV", price: "Twelve dollars" }
        api_authorization_header user.auth_token
        post :create, { user_id: user.id, trip: @invalid_trip_attributes }
      end

      it "renders an errors json" do
        trip_response = json_response
        expect(trip_response).to have_key(:errors)
      end

      it "renders the json errors on whye the user could not be created" do
        trip_response = json_response
        expect(trip_response[:errors][:price]).to include "is not a number"
      end

      it { should respond_with 422 }
    end
  end

  describe "PUT/PATCH #update" do
    before(:each) do
      @user = FactoryGirl.create :user
      @trip = FactoryGirl.create :trip, user: @user
      api_authorization_header @user.auth_token
    end

    context "when is successfully updated" do
      before(:each) do
        patch :update, { user_id: @user.id, id: @trip.id,
              trip: { title: "An expensive TV" } }
      end

      it "renders the json representation for the updated user" do
        trip_response = json_response
        expect(trip_response[:title]).to eql "An expensive TV"
      end

      it { should respond_with 200 }
    end

    context "when is not updated" do
      before(:each) do
        patch :update, { user_id: @user.id, id: @trip.id,
              trip: { price: "two hundred" } }
      end

      it "renders an errors json" do
        trip_response = json_response
        expect(trip_response).to have_key(:errors)
      end

      it "renders the json errors on whye the user could not be created" do
        trip_response = json_response
        expect(trip_response[:errors][:price]).to include "is not a number"
      end

      it { should respond_with 422 }
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @user = FactoryGirl.create :user
      @trip = FactoryGirl.create :trip, user: @user
      api_authorization_header @user.auth_token
      delete :destroy, { user_id: @user.id, id: @trip.id }
    end

    it { should respond_with 204 }
  end

end
