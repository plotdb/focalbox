# option
#  - host: host node(s) to use focalbox
main = (opt = {}) ->
  @opt = opt
  @ <<< box: null, target: null
  @hosts = []
  @add-host opt.host
  @padding = opt.padding or 6
  @init!
  @

main.prototype = Object.create(Object.prototype) <<< do
  init: ->
    document.body.appendChild @box = document.createElement \div
    @box.classList.add \focalbox, \hidden

  add-host: (h) ->
    @hosts ++= (if Array.isArray(h) => h else [h])
      .map -> if typeof(it) == \string => document.querySelector(it) else if it => it else null
      .filter -> it

  set-target: (n) -> @target = n; @render!
  render: ->
    n = @target
    if !n => return @box.classList.remove \active, \moving
    [box,p] = [n.getBoundingClientRect!, @padding]
    @box.style <<< do
      left: "#{box.x - p}px"
      top: "#{box.y - p}px"
      width: "#{box.width + p * 2}px"
      height: "#{box.height + p * 2}px"
    if @box.classList.contains \active => @box.classList.add \moving
    @box.classList.add \active


if module? => module.exports = main
if window? => window.focalbox = main
