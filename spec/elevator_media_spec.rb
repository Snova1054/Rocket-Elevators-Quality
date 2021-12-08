require 'rails_helper'
require 'elevator_media'
require 'rest-client'

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
            context do
                it do
                    
                end
            end
        end
    end
end