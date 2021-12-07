require 'rails_helper'
require 'elevator_media'

describe ElevatorMedia, type: :feature do
    describe "Streamer" do
        describe ".getContent" do
            context "test for a webpage" do
                it "returns html ( a string that contains valid html ready to be
                displayed on a web page ex: '<div>Interesting content</div>' )" do
                    expect(ElevatorMedia::Streamer.getContent("")).to eq(0)
                end
            end
            context "test for a webfolio" do
                it "returns html ( a string that contains valid html ready to be
                displayed on a web page ex: '<div>Interesting content</div>' )" do
                    expect(ElevatorMedia::Streamer.getContent("234")).to eq(3)
                end
            end
            context "test for index page" do
                it "returns a specific text confirming the page as index" do
                    visit "home#index"
                    # expect(page).to have_content("Daniel Gallardo")
                    expect(page.body).to include("Daniel wallardo")
                end
            end
        end
    end
end