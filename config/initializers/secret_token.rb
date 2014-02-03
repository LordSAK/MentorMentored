# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end
#MentorMentored::Application.config.secret_key_base = 'a1cae4797814e2af7d5fafc1633708662a37b9ce7ca63c87ae2535b49879697d9f1bbcffa62f6ecfa1bcf19884c6c0aa674579a1260c8cfc2b92c66f734462b4'
MentorMentored::Application.config.secret_key_base = secure_token
