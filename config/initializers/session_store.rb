# -*- encoding : utf-8 -*-
# Be sure to restart your server when you modify this file.

Tmca::Application.config.session_store :cookie_store, :key => '_tmca_session', :expire_after => 1.week, :secret => 'xjaqmfqjr1xjaqmfqjr1'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Tmca::Application.config.session_store :active_record_store
