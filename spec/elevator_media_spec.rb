require 'rails_helper'
require 'elevator_media'
require 'rest-client'
require 'devise'

describe ElevatorMedia, type: :feature do
    describe "Streamer" do
        describe ".getContent" do
            context "verify the integrity of an API call" do
                it "returns a random fact about a number in between <divs>" do
                    random_number = (rand() * 100).to_i
                    type = ["math", "trivia"].sample
                    response = RestClient.get("http://numbersapi.com/#{random_number}/#{type}")
                    expect(ElevatorMedia::Streamer.getContent(response)).to include("<div>#{response}</div>") && be_a(String)
                end
            end
            context "verify the integrity of a data from the Customer's company name table from the database" do
                it "returns a customer's company name in between <divs>" do
                    random_company_name = Customer.all.sample.company_name
                    expect(ElevatorMedia::Streamer.getContent(random_company_name)).to include("<div>#{random_company_name}</div>") && be_a(String)
                end
            end
            context "valid with incorrect credentials" do
                it "tries to log in with fake credentials and returns an 'invalid' text" do
                    visit new_user_session_path
                    fill_in "user_email", with: "hello@go.ca"
                    fill_in "user_password", with: "123123"
                    click_button "Log in"
                
                    expect(page).to have_text "Invalid"
                    # find('#user-menu-button').click
                    # expect(page).to have_link "Sign out"
                    # expect(page).to have_current_path root_path
                end
            end
            context "valid with correct credentials" do
                it "tries to log in with real credentials and returns a 'success' text" do
                    visit new_user_session_path
                    fill_in "user_email", with: "nicolas.genest@codeboxx.biz"
                    fill_in "user_password", with: "Codeboxx1"
                    click_button "Log in"
                
                    expect(page).to have_current_path root_path
                    expect(page).to have_link "LOGOUT"
                    expect(page).to have_text "Signed in successfully."
                end
            end
        end
    end
end