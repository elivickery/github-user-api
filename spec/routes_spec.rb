require File.expand_path '../spec_helper.rb', __FILE__

describe "Github User Data API" do

    it "should allow accessing the homepage but return an error message" do
        get '/'
        expect(last_response).to be_ok
        expect(last_response.body).to include('Error: you must enter a username.')
    end

    describe '/user route' do

        it "returns valid data for an existing GitHub user" do
            get '/user', {"username" => "holman"}
            expect(last_response.body).to include("holman")
        end

        it "returns a not found response for a non-existent GitHub user" do
            get '/user', {"username" => "aasfdasdfasdasdfasf"}
            expect(last_response.body).to include("Not Found")
        end
    end

    describe '/followers route' do

        it "returns a hash of users for an existing GitHub user" do
            get '/followers', {"username" => "holman", "page" => 2}
            expect(last_response.body).to include("lunatech")
        end

        it "returns a not found response for a non-existent GitHub user" do
            get '/followers', {"username" => "asdfasfasdfasfasdfasfd", "page" => 1}
            expect(last_response.body).to include("Not Found")
        end

        it "returns an empty array if the page does not exist" do
            get '/followers', {"username" => "elivickery", "page" => 2}
            expect(last_response.body).to eq("[]")
        end

    end

end
