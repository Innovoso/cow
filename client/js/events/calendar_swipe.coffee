getFirstOfPreviousMonth = (date) ->
  [month, year] = monthAndYear(date)
  new Date(year, month - 1, 1, 0, 0, 0, 0)

getFirstOfNextMonth = (date) ->
  [month, year] = monthAndYear(date)
  new Date(year, month + 1, 1, 0, 0, 0, 0)

addSelectDateToFirstOfMonth = (date) ->
  dateId = getSelectedDateId(date)
  $('#' + dateId).addClass('selectedDate')

Template.eventsCalendar.rendered = =>
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
      currentDayId = getSelectedDateId(Session.get 'currentDate')

      if $('#' + currentDayId).length == 0
        addSelectDateToFirstOfMonth(Session.get 'calendarDate')
