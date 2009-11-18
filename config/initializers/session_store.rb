# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sb_session',
  :secret      => '7da7c5f15e55ce7ddba3efabfa341babea45f2996467df614ceccc8e1518d3c2dfc775d63f1fe978cd2d4a3dc76f683e9fe497bec743592de2676298943be7d9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
