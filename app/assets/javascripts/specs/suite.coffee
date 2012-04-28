class Specs
  specs: [
    'fooSpec',
    'barSpec'
  ]
  toRequires: ->
    requires = []
    for spec in @specs
      requires.push "specs/#{spec}"
    requires

define ['logger'].concat(new Specs().toRequires()), (log) ->
  class Suite
    run: ->
      log.info "running tests from inside the suite"
      jasmineEnv = jasmine.getEnv()
      jasmineEnv.updateInterval = 1000
      trivialReporter = new jasmine.TrivialReporter()
      jasmineEnv.addReporter(trivialReporter)
      jasmineEnv.specFilter = (spec) ->
        trivialReporter.specFilter(spec)

      currentWindowOnLoad = window.onload
      window.onload = () ->
        if currentWindowOnLoad
          currentWindowOnLoad()
        execJasmine()

      execJasmine = -> jasmineEnv.execute()

  new Suite()