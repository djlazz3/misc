require 'twilio-ruby' 
 
# put your own credentials here 
account_sid = 'AC18e44553345caa6b2dce3022b3792416' 
auth_token = '311f5311b288d0db19019f4c5f9fbd24' 
 
# set up a client to talk to the Twilio REST API 
@client = Twilio::REST::Client.new account_sid, auth_token 
 
@client.account.sms.messages.create(
    :body => "The Illuminati are watching you",
    :to => '+17863722607', 
    :from => '+13853556353')