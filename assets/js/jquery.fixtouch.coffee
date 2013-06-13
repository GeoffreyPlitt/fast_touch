# Purpose: adds touchenter / touchleave events back

is_android = ->
  navigator.userAgent.toLowerCase().indexOf('android') > -1

if is_android()
  el_from_point = (point)->
    document.elementFromPoint point.screenX, point.screenY
else
  el_from_point = (point)->
    document.elementFromPoint point.clientX, point.clientY

actual_element_touched = (e) ->
  e.stopPropagation()
  e.preventDefault()
  cur_touch = e.originalEvent.targetTouches[0]
  if cur_touch?
    actual_el = el_from_point cur_touch
    actual_el # return
  else
    null # return

_last = null
$.fn.fixtouch = ->
  this.live 'touchstart touchmove', (e) ->
    actual = actual_element_touched e
    if _last != actual
      if _last
        $(_last).trigger 'touchleave', _last
      $(actual).trigger 'touchenter', actual
    _last = actual
  this.live 'touchend touchcancel', (e) ->
    actual = actual_element_touched e
    $(_last).trigger 'touchleave', _last
    $(actual).trigger 'touchleave', actual
    _last=null