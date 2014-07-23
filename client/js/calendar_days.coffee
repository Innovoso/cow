Template.dateCells.helpers

  datesArray: ->
    getCalendarArrayForMonthWithDate(calendarDate || new Date())

Template.dateCells.rendered = ->
  console.log "rendered"







