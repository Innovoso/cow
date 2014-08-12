SmartTagRegex = /#[\w\.\s\(]*\)(?=\s|$)|#[\w\.\(]*(?=\s|$)/
JustTagRegex = /#[\w\.]*/

# returns TagInfo if caret is on a smart tag or null otherwise
findCurrentTag = (input_field) ->

  findStartPosOfClosestTag = (input_field) ->
    cursorPos = input_field.caret()
    message = input_field.val() || ""
    message.lastIndexOf('#', cursorPos) || 0

  findClosestTag = (input_field) ->
    position = findStartPosOfClosestTag(input_field)
    message = input_field.val() || ""
    substring = message.substring(position)
    tag = substring.match(SmartTagRegex)
    { tag: tag[0], start: position, end: position + tag[0].length} if tag

  caretOnTag = (tagInfo) ->
    if tagInfo
      cursorPos = $('#message').caret()
      cursorPos >= tagInfo.start && cursorPos <= tagInfo.end && tagInfo.start >= 0
    else
      false

  if input_field
    closestTag = findClosestTag(input_field)
    return closestTag if caretOnTag(closestTag)

appendTagContent = (tag) ->

  openingParenthesis = (val) ->
    index = val.indexOf('(') + 1
    index = undefined if index < 0
    tag.open = index
    index

  closingParenthesis = (val) ->
    index = val.lastIndexOf(')')
    index = val.length if index < 0
    tag.close = index
    index

  opening = openingParenthesis(tag.tag)
  closing = closingParenthesis(tag.tag)
  if opening && closing
    tag.content = tag.tag.substring(opening, closing)
  tag

appendTagName = (tag) ->
  name = tag.tag.match(JustTagRegex)
  if name && name[0]
    tag.name = name[0]
    tag

@currentSmartTag = (input_field) ->
  tag = findCurrentTag(input_field)
  tag = appendTagContent(tag) if tag
  tag = appendTagName(tag) if tag
  tag

@inSmartTag = ->
  !!currentSmartTag($('#message'))

@replaceTag = (tag, replacement) ->
  input = $('#message')
  input.range(tag.start, tag.end)
  input.range(replacement)
  input.caret(tag.start + replacement.length - 1)

@tagContent = (tagInfo) ->
  startPos = tagInfo.tag.indexOf('(')
  endPos = tagInfo.tag.indexOf(')')
  endPos = tagInfo.end if endPos < 0
  content = tagInfo.tag.substring(startPos + 1, endPos)
  content