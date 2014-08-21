UI.registerHelper 'messageTime', (timestamp) ->
  m = moment(timestamp)
  if m.isSame(moment(), 'day')
    m.format('h:mm a')
  else
    m.fromNow()

UI.registerHelper "formatCalendarCellDate", (datetime) =>
  moment(datetime).format('D')

UI.registerHelper "formatEventsListStartTime", (datetime) =>
  moment(datetime).format('h mm a')

UI.registerHelper "formatEventsListEndTime", (datetime) =>
  if datetime
    "-" + moment(datetime).format('h mm a')

UI.registerHelper "formatEventsListDay", (datetime) =>
  moment(datetime).format('DD MMM YY')
# moment(datetime).format('e') + " " +

UI.registerHelper "formatEventsListDayId", (datetime) ->
  console.log this.key
  # moment(this.key).format('MDYY'))



