# focalbox

a box for highlighting your current focus


## Usage

include required js, css and create a `focalbox` instance:

    <script src="focalbox.min.js"></script>
    <link rel="stylesheet" type="text/css" href="focalbox.min.js"/>
    <script> fb = new focalbox(); </script>

## Options

constructor options:

 - host: host for which this focalbox should work in.
   - Either a single element, or array of elements. default: no host.
 - selector: if set, only elements matching this selector can be targeted.
 - padding: spacing between focalbox and target element. default 6
 - class: additional css classes to apply on the focalbox. can be an array or space-separated string.
   - focalbox provides several basic classes for simple styling, include `danger`, `success` and `warning`.


## API

 - focus(enable): set enable to true if to enter focus mode.
 - isFocused(): return true if focalbox is in focus mode
 - addHost(hosts): add elements ( Element or Array of Element ) as focalbox hosts.
 - removeHost(host): remove elements ( Element or Array of Element ) from focalbox hosts.
 - setTarget(node): target `node` with focalbox
 - render: update focalbox


## Focus Mode

For now we use CSS `box-shadow` for overlay-with-hole effect in focus mode. It has following limitation:
 - This allows only one focus focalbox at the same time, otherwise focalboxs will cover each other.
 - Performance might be affected due to box-shadow calculation.
 - Shadow range is hardcoded thus user may run out of the mask with a very long document.

Other possible approachs include:
 - use 2 elements nested: ( [@plotdb/masking](https://github.com/plotdb/masking) )
   - root overlay with mix-blend-mode: hard-light
   - hole div with #888 background color.
 - use 4 DIVs to make up the overlay?
 - fat border / outline
 - small GIF with hole inside, and resized with `image-rendering` set to `pixelated`
 - disucssion: https://stackoverflow.com/questions/20242806/hole-in-overlay-with-css


## License

MIT
