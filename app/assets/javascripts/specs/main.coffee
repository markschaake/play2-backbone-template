# This is the entry point for the entire app.
"use strict"
requirejs.config
  baseUrl: "/assets/javascripts"
  paths:
    'backbone': 'libs/backbone-min'
    'underscore': 'libs/underscore-min'
  shim:
    'backbone':
      deps: ['underscore', 'jquery']
      exports: 'Backbone'
    'libs/jasmine-html':
      deps: ['libs/jasmine']

require ['libs/jasmine-html', 'backbone', 'logger', 'specs/suite'], (jasHtml, Backbone, log, suite) ->
  log.level = log.INFO
  suite.run()
