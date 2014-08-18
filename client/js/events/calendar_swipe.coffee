getFirstOfPreviousMonth = (date) ->
  [month, year] = monthAndYear(date)
  new Date(year, month - 1, 1, 0, 0, 0, 0)

getFirstOfNextMonth = (date) ->
  [month, year] = monthAndYear(date)
  new Date(year, month + 1, 1, 0, 0, 0, 0)

addSelectDateToFirstOfMonth = ->
  currentDayId = getIdForCurrentDate()
  dateId = getIdForSelectDate(Session.get 'calendarDate')

  if $('#' + currentDayId).length == 0
    $('#' + dateId).addClass('selectedDate')

Template.events.rendered = =>
  $('.dateCells').swipe
    swipe: (event, direction, distance, duration, fingerCount, fingerData) =>

      switch direction
        when 'right'
          Session.set 'calendarDate', getFirstOfPreviousMonth(Session.get 'calendarDate')
          cells = getCalendarArrayForMonthWithDate(Session.get 'calendarDate')

        when 'left'
          Session.set 'calendarDate', getFirstOfNextMonth(Session.get 'calendarDate')
          cells = getCalendarArrayForMonthWithDate(Session.get 'calendarDate')

      $('.month').fadeOut(1).remove()

      instance = UI.renderWithData(Template.dateCells, { feed: cells })
      UI.insert(instance, $('.dateCells')[0])

      addSelectDateToFirstOfMonth()
