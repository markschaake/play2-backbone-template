# This is the entry point for the entire app.
"use strict"
require.config
  baseUrl: "/assets/javascripts"

require ['order!underscore', 'order!backbone', 'order!logger', 'specs/suite'], (_, Backbone, log, suite) ->
  log.level = log.INFO
  suite.run()
