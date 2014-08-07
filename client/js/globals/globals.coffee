Session.set 'selectedDate', @beginningOfDay(new Date())
Session.set 'currentDate', @beginningOfDay(new Date())
Session.set 'calendarDate', @getStartOfMonth(new Date())
Session.set 'isMobile', true