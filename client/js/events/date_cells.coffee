Template.dateCells.helpers

  datesArray: ->
    getCalendarArrayForMonthWithDate(calendarDate || new Date())

  id: -> "c" + moment(this).format("MDYY")

Template.dateCells.rendered = ->
  console.log "rendered"


Template.dateCells.events
  'click .dateCell': (e) ->
    $('.dateCell').removeClass('selectedDate')
    $(e.target).addClass('selectedDate')

