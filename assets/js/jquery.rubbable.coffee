# Purpose: makes rubbable arrays of buttons easy, see index.html
# Requires: jquery.fixtouch.js

logger = (x) ->
  $('#padding1').append ' '+x

_last2=null
$.fn.rubbable = (_on, _off) ->
  this.live 'touchenter touchleave', (e) ->
    # logger (e.type+':'+e.target.id)
    _off _last2
    if e.type == 'touchleave'
      _last2=null
    else
      _on e.target
      _last2=e.target