SmartTagRegex = /#[\w\.\s\(]*\)(?=\s|$)|#[\w\.\(]*(?=\s|$)/
JustTagRegex = /#[\w\.]*/

indexOfOpeningParenthesis = (val) ->
  index = val.indexOf('(') + 1
  index = undefined if index <= 0
  index

indexOfClosingParenthesis = (val) ->
  index = val.lastIndexOf(')')
  index = val.length if index < 0
  index

findCurrentTag = (input_field) ->

  findStartPosOfClosestTag = (input_field) ->
    cursorPos = input_field.caret()
    value = input_field.val() || ""
    value.lastIndexOf('#', cursorPos) || 0

  findClosestTag = (input_field) ->
    startPos = findStartPosOfClosestTag(input_field)
    value = input_field.val() || ""
    substring = value.substring(startPos)
    match = substring.match(SmartTagRegex)
    { tag: match[0], start: startPos, end: startPos + match[0].length} if match

  caretOnTag = (tag) ->
    if tag
      cursorPos = messageField().caret()
      cursorPos >= tag.start && cursorPos <= tag.end && tag.start >= 0
    else
      false

  if input_field
    closestTag = findClosestTag(input_field)
    return closestTag if caretOnTag(closestTag)

@currentSmartTag = (input_field) ->

  appendTagContent = (tag) ->
    tag.open = opening = indexOfOpeningParenthesis(tag.tag)
    tag.close = closing = indexOfClosingParenthesis(tag.tag)
    tag.content = tag.tag.substring(opening, closing) if opening
    tag

  appendTagName = (tag) ->
    name = tag.tag.match(JustTagRegex)
    if name && name[0]
      tag.name = name[0]
      tag

  appendInTag = (input_field, tag) ->
    pos = input_field.caret()
    inTag = !!tag && pos >= tag.open && pos <= tag.close
    tag.in = inTag
    tag

  tag = findCurrentTag(input_field)

  if tag
    appendTagContent(tag)
    appendTagName(tag)
    appendInTag(input_field, tag)

  tag
