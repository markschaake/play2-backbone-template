define ['logger', 'backbone'], (log, bb) ->
  class App
    initialize: ->
      log.info "we are live!"
      class Foo extends bb.Model
        initialize: -> log.info "initialized a Backbone Foo!"

      new Foo()

  new App()