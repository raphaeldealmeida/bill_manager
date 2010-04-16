# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bill_manager_session',
  :secret      => '48b2a50ec094a973cfa70fc9f2b42f2d9c6e4a663196efeee1db07fbefb91360b925864f0e25106041758f18766a04d8f336c68544317b25d2218dad36cc2a75'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
