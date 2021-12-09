require 'rest-client'

module ElevatorMedia
    class Streamer
        def self.getContent(response)
            text_to_change = "<div>#{response}</div>"
            return text_to_change
        end
    end
end