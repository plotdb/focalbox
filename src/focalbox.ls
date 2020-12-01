# option
#  - host: host node(s) to use focalbox
main = (opt = {}) ->
  @opt = opt
  @ <<< box: null, target: null
  @hosts = []
  @add-host opt.host
  @selector = opt.selector or null
  @padding = opt.padding or 6
  @init!
  @

main.prototype = Object.create(Object.prototype) <<< do
  init: ->
    document.body.appendChild @box = document.createElement \div
    @box.classList.add \focalbox, \hidden
    @set-mode(@opt.mode or '')
    renderinfo.add @

  set-mode: (n) ->
    if @mode => @box.classList.remove @mode
    if (@mode = n) => @box.classList.add @mode

  add-host: (h) ->
    @hosts ++= (if Array.isArray(h) => h else [h])
      .map -> if typeof(it) == \string => document.querySelector(it) else if it => it else null
      .filter -> it

  set-target: (n) ->
    if n and @selector => if !(n.matches and n.matches(@selector)) => return
    if !@hosts.filter(-> it.contains n).length => n = null
    @target = n; @render!
  render: ->
    n = @target
    if !n => return @box.classList.remove \active, \moving
    [box,p] = [n.getBoundingClientRect!, @padding]
    x = box.x - p + window.scrollX
    y = box.y - p + window.scrollY
    @box.style <<< do
      left: "#{x}px"
      top: "#{y}px"
      width: "#{box.width + p * 2}px"
      height: "#{box.height + p * 2}px"
    if @box.classList.contains \active => @box.classList.add \moving
    @box.classList.add \active

renderinfo = do
  list: []
  running: false
  render: -> @list.map -> it.render!
  tick: ->
    if !renderinfo.running => return
    setTimeout (~> requestAnimationFrame ~> @render!), 500
  add: (it) ->
    @list.push it
    if @running => return
    @running = true
    @render!

window.addEventListener \scroll, -> renderinfo.render!

if module? => module.exports = main
if window? => window.focalbox = main
