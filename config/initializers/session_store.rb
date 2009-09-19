# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dcamp_session',
  :secret      => '2455c71302f9d27045d15ebb2eb8ba96d8b9142def6c61fbbf2989533d5b7d80433ee9fc3f99352362497736dfb63aa2cb125e519d66e668626c84aeb3b18e2c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
