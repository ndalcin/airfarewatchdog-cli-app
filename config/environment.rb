require 'bundler'

Bundler.require
require 'open-uri'
require 'pry'
require 'nokogiri'

require_relative '../lib/flightdeals-cli/scraper'
require_relative '../lib/flightdeals-cli/flightdeal'
require_relative '../lib/flightdeals-cli/dealslist'
require_relative '../lib/flightdeals-cli/cli'
