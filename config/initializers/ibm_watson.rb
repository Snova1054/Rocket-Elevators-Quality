require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"
include IBMWatson

authenticator = Authenticators::IamAuthenticator.new(
  apikey: "XonmBszwvVddmK8DmLFOwEkGvfHnxGxkd-FpacGy22OR"
)

$text_to_speech = TextToSpeechV1.new(
  authenticator: authenticator
)
$text_to_speech.service_url = ENV["ibm_watson_url"]
