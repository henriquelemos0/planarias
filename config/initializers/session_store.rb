# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_planarias_session',
  :secret      => 'ecca9a45896b53d1e93f030f0fa54518109530f02ddfbb4caaadffc8f9f9aa1ea166ceb51f46cfba10edb1e2b441b95857c89418f3646808401ef2d2451441d5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
