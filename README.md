# topiary-yuck

> Topiary config to format yuck code

## Usage

Git clone this repo and then point Topiary to it by setting these environment variables:

```sh
TOPIARY_CONFIG_FILE="path/to/topiary-yuck/languages.ncl"
TOPIARY_LANGUAGES_DIR="path/to/topiary-yuck/languages/"
```

<!-- TODO: Add section on how to use with other languages -->
<!-- TODO: Add section on nix usage, if I add some nix related stuff -->

## Formatting style

Check out the `./tests/expected_*.yuck` files to see for yourself what the output looks like.

## Acknowledgements

Special thanks to:

- [Tweag](https://github.com/tweag/topiary) for the Topiary project, enabling this in the first place.
- [Elkowar](https://github.com/elkowar/eww) for his amazing work on eww
- [BlindFS](https://github.com/blindFS/topiary-nushell) for topiary-nushell, providing an example of how to setup something like this

## License 

This project is license under the [MIT License](LICENSE.txt).
