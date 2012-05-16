# This is the entry point for the entire app.
"use strict"

require ['logger', 'app'], (log, app) ->
  log.level = log.INFO
  app.initialize()