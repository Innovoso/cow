getFirstOfPreviousMonth = (date) ->
  [month, year] = monthAndYear(date)
  new Date(year, month - 1, 1, 0, 0, 0, 0)

getFirstOfNextMonth = (date) ->
  [month, year] = monthAndYear(date)
  new Date(year, month + 1, 1, 0, 0, 0, 0)

addSelectDateToFirstOfMonth = (date) ->
  dateId = getSelectedDateIdForDate(date)
  $('#' + dateId).addClass('selectedDate')

Template.eventsCalendar.rendered = =>
  $('.dateCells').swipe
    swipe: (event, direction, distance, duration, fingerCount, fingerData) =>

      switch direction
        when 'left'
          @calendarDate = getFirstOfPreviousMonth(@calendarDate)
          cells = getCalendarArrayForMonthWithDate(@calendarDate)

        when 'right'
          @calendarDate = getFirstOfNextMonth(@calendarDate)
          cells = getCalendarArrayForMonthWithDate(@calendarDate)

      $('.month').fadeOut(1).remove()

      instance = UI.renderWithData(Template.dateCells, { feed: cells })
      UI.insert(instance, $('.dateCells')[0])
      currentDayId = getSelectedDateIdForDate(@currentDate)

      if $('#' + currentDayId).length == 0
        addSelectDateToFirstOfMonth(@calendarDate)
