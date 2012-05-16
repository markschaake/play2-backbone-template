# This is the entry point for the entire app.
"use strict"
require.config
  baseUrl: "/assets/javascripts"

require ['libs/order!libs/jasmine', 'libs/order!libs/jasmine-html', 'libs/order!underscore', 'libs/order!backbone', 'libs/order!logger', 'libs/order!specs/suite'], (jas, jasHtml, _, Backbone, log, suite) ->
  log.level = log.INFO
  suite.run()
