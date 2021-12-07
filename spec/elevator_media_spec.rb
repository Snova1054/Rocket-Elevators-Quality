require 'streamer'

describe Streamer do
    describe ".getContent" do
        context "test for a webpage" do
            it "returns html ( a string that contains valid html ready to be
            displayed on a web page ex: '<div>Interesting content</div>' )" do
                expect(Streamer.getContent("")).to eq(0)
            end
        end
        context "test for a webfolio" do
            it "returns html ( a string that contains valid html ready to be
            displayed on a web page ex: '<div>Interesting content</div>' )" do
                expect(Streamer.getContent("234")).to eq(3)
            end
        end
    end
end