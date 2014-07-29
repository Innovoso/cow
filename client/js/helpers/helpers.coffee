UI.registerHelper 'messageTime', (timestamp) ->
  m = moment(timestamp)
  if m.isSame(moment(), 'day')
    m.format('h:mm a')
  else
    m.fromNow()


UI.registerHelper "formatCalendarCellDate", (datetime) =>

  moment(datetime).format('D')









