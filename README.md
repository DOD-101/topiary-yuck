# topiary-yuck

> Format your yuck files using Topiary

## Usage

Git clone this repo and then point Topiary to it by setting these environment variables:

```sh
TOPIARY_CONFIG_FILE="path/to/topiary-yuck/languages.ncl"
TOPIARY_LANGUAGES_DIR="path/to/topiary-yuck/languages/"
```

<!-- TODO: Add section on how to use with other languages -->

### Using nix

If you're using nix/NixOS you can use the provided [flake](./flake.nix) to install `topiary-yuck`, which just wraps topiary.

This also means that you can still use topiary to format other file types, without any additional config.

## Formatting style

```yuck
(defwidget animalButton [ emoji ]
  (box
    :class "animalLayout"
    (eventbox
      :class `animal ${selected == emoji ? "selected" : ""}`
      :cursor "pointer"
      :onhover "eww update selected=${emoji}"
      emoji)))
```

For more examples check out the `./tests/expected_*.yuck` files.

## Acknowledgements

Special thanks to:

- [Tweag](https://github.com/tweag/topiary) for the Topiary project, enabling this in the first place.
- [Elkowar](https://github.com/elkowar/eww) for his amazing work on eww
- [BlindFS](https://github.com/blindFS/topiary-nushell) for topiary-nushell, providing an example of how to setup something like this

## License 

This project is license under the [MIT License](LICENSE.txt).
