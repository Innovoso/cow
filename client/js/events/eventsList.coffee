Template.eventsList.helpers
  eventsArray: (startDate, endDate)->
    startDate = startDate || Session.get 'calendarDate'
    endDate = endDate || getEndOfMonth(Session.get 'calendarDate')
    console.log getEventsList(startDate, endDate)
    getEventsList(startDate, endDate)