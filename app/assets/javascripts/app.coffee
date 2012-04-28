define ['logger'], (log) ->
  class App
    initialize: ->
      log.info "we are live!"

  new App()