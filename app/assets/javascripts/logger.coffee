define [], ->
  class Logger
    INFO :
      name : "INFO", val : 1, print: (msg) -> console.info msg
    WARN :
      name : "WARN", val : 2, print: (msg) -> console.warn msg
    ERROR :
      name : "ERROR", val : 3, print: (msg) -> console.error msg
    _print : (level, msg) ->
      level.print msg if level.val >= @level.val

    trace: (msg) -> console.trace()
    info : (msg) -> @_print(@INFO, msg)
    warn : (msg) -> @_print(@WARN, msg)
    error : (msg) -> @_print(@ERROR, msg)

    constructor: ->
      window.log = @

      # Can set the log level externally by setting a global window.logLevel variable
      # to a string representation of a log level.
      if window.logLevel?
        switch window.logLevel
          when "INFO" then log.level = log.INFO
          when "WARN" then log.level = log.WARN
          else log.level = log.ERROR
      else
        log.level = log.INFO

  new Logger()