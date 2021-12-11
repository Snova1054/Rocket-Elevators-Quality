require 'rails_helper'
require 'elevator_media'
require 'rest-client'

describe ElevatorMedia, type: :feature do
    describe "Streamer" do
        describe ".getContent" do
            context "verify the integrity of an API call" do
                it "returns a random fact about a number in between <divs>" do
                      = (rand() * 100).to_i
                       = ["math", "trivia"].sample
                    ㅤ = RestClient.get("http://numbersapi.com/#{ }/#{  }")
                    expect(ElevatorMedia::Streamer.getContent(ㅤ)).to include("<div>#{ㅤ}</div>") && be_a(String)
                end
            end
            context "verify the integrity of a data from the Customer's company name table from the database" do
                it "returns a customer's company name in between <divs>" do
                    ㅤ = Customer.all.sample.company_name
                    expect(ElevatorMedia::Streamer.getContent(ㅤ)).to include("<div>#{ㅤ}</div>") && be_a(String)
                end
            end
            context "valid with incorrect credentials" do
                it "tries to log in with fake credentials and returns an 'invalid' text" do
                    visit new_user_session_path
                    fill_in "user_email", with: "hello@go.ca"
                    fill_in "user_password", with: "123123"
                    click_button "Log in"

                    expect(page).to have_text "Invalid"
                    expect(ElevatorMedia::Streamer.getContent("Invalid")).to include("<div>Invalid</div>") && be_a(String)
                end
            end
            # context "valid with correct credentials" do
            #     it "tries to log in with real credentials and returns a 'successful' text" do
            #         visit new_user_session_path
            #         fill_in "user_email", with: "nicolas.genest@codeboxx.biz"
            #         fill_in "user_password", with: "Codeboxx1"
            #         click_button "Log in"
                    
            #         expect(page).to have_current_path root_path
            #         expect(page).to have_link "LOGOUT"
            #         expect(page).to have_text "Signed in successfully."
            #         expect(ElevatorMedia::Streamer.getContent("Signed in successfully.")).to include("<div>Signed in successfully.</div>") && be_a(String)
            #     end
            # end
        end
    end
end