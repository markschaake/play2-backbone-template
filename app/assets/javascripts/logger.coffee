define [], ->
  class Logger
    INFO :
      name : "INFO", val : 1
    WARN :
      name : "WARN", val : 2
    ERROR :
      name : "ERROR", val : 3
    _print : (level, msg) ->
      # TODO consider dealing with browser support of "console" here,
      # For now, we just fail to log messages if window.console doesn't exist
      if window.console?
        console.log "[#{level.name}] #{msg}" if level.val >= @level.val
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
        log.level = log.WARN

  new Logger()