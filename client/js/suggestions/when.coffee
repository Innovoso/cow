Dictionary =
  'until': 'to'
  'yesterday': -> "this " + moment().add('days', -1).format('dddd')
  'today': -> "this " + moment().format('dddd')
  'tomorrow': -> moment().add('days', 1).format('dddd')

getStartDate = ->
  date = Session.get('startDate')
  if date then moment(date) else date

getEndDate = ->
  date = Session.get('endDate')
  if date then moment(date) else
    date = getStartDate()
    if date then moment(date).add('hours', 1) else date

setStartDate = (date) ->
  Session.set('startDate', date)

setEndDate = (date) ->
  Session.set('endDate', date)

remainder = (result) ->
  result.concordance.replace(result.text, '')

setRemainder = (text) ->
  Session.set('remainder', text)

getRemainder = (text) ->
  Session.get('remainder', text)

@processInput = (input) ->
  if input
    for own k, v of Dictionary
      input = input.toLowerCase().replace(k, v)
  input

Template.when.events
  'keyup #chrono_input': (e, t) ->
    value = processInput(e.currentTarget.value)
    result = chrono.parse(value)[0]

    if result
      setStartDate(result.startDate)
      setEndDate(result.endDate)
      setRemainder(remainder(result))
    else
      setStartDate(undefined)
      setEndDate(undefined)

UI.registerHelper 'weekday', (date) ->
  date.format('dddd') if date

UI.registerHelper 'date', (date) ->
  date.format('D MMMM, YYYY') if date

UI.registerHelper 'time', (date) ->
  date.format('ha') if date

Template.when.helpers
  startDate: () -> getStartDate()
  endDate: () -> getEndDate()
  remainder: -> getRemainder()
  withinDay: ->
    startDate = getStartDate()
    endDate = getEndDate()
    if startDate && endDate
      d = startDate.format('D MMMM, YYYY') == endDate.format('D MMMM, YYYY')
      return d
    true
