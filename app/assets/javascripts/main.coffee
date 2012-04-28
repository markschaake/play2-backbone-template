# This is the entry point for the entire app.
"use strict"

require ['logger', 'app', 'bootstrap.min'], (log, app) ->
  log.level = log.INFO
  app.initialize()