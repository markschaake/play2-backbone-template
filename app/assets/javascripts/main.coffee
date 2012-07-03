# This is the entry point for the entire app.
"use strict"

requirejs.config
  baseUrl: "/assets/javascripts"
  paths:
    'underscore': 'libs/underscore-min'
    'backbone': 'libs/backbone-min'
  shim:
    'backbone':
      deps: ['underscore', 'jquery']
      exports: 'Backbone'

require ['logger', 'app'], (log, app) ->
  log.level = log.INFO
  app.initialize()