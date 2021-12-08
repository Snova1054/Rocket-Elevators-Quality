require 'rest-client'

module ElevatorMedia
    class Streamer
        def self.getContent(response)
            text_to_change = "<div>#{response}</div>"
            # url = URI("http://numbersapi.com/50/trivia")
            # puts(url)
            return text_to_change
            # # yes = input.body.find{ |string| string == "Daniel Gallardo"}
            # puts(input.body.class)
            # if input.body.include? "HELLO AMERICA"
            #     puts("ALREADY AMERICA")
            # else
            #     input.body.prepend("HELLO AMERICA")
            #     puts("NEW FOUND AMERICA")
            # end
        end
    end
end