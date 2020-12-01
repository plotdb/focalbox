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

 - add-host(hosts): add elements ( Element or Array of Element ) as focalbox hosts.
 - remove-host(host): remove elements ( Element or Array of Element ) from focalbox hosts.
 - set-target(node): target `node` with focalbox
 - render: update focalbox


## License

MIT
