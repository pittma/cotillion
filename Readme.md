Cotillion
=========

A place for me (and you!) to keep various formalizations that we're
piddling with.

## Usage

Cotillion is managed with [a small bash script](cot) that automates
interacting with Agda and Pandoc.

```
cot: A minimal Agda static-site generator.
USAGE: cot [SUBCOMMAND]
Subcommands:
  all        Build and copy both the Adga files and the static files into the html directory.
  static     Copy the static files into the html directory.
  serve      Start a webserver in the html directory.
  new [NAME] Start a new Cotillion project.
```

I just copied the `cot` script to `/usr/local/bin`, but anywhere on
your path will do.

### `Index.lagda.md`

The `cot` script uses the `Index.lagda.md` module as the root, you
should use to load your other modules with `import <module>`. After
building, the script replaces the capital I in the file name with a
lower case i so it can be served at the root of a web directory.

See an example here: https://cotillion.dpitt.me

## Dependencies

* Agda
* Pandoc
* Python 3

## Installing Agda

To use Agda, you must first install it.

1. Install [Stack](https://docs.haskellstack.org/en/stable/README/) if
   you don't have it installed already.

   ```sh
   $ curl -sSL https://get.haskellstack.org/ | sh
   ```

1. Clone the Agda source.

   ```sh
   $ git clone git@github.com:agda/agda.git
   ```

1. Use Stack to build and install Agda.

   ```sh
   $ cd agda
   $ stack --stack-yaml stack-<resolver>.yaml install
   ```
   
1. Make a coffee.

1. You should see a few lines stating that two binaries were
   installed: `agda` and `agda-mode`. `agda-mode` is the Emacs
   integration. To hook Agda up to Emacs, run that command and tell it
   to set itself up. This requires that `stack` installed binaries are
   on your `$PATH`. `~/.local/bin` on my Linux machine.

   ```sh
   $ agda-mode setup
   ```

   If this is not your first go around with an Agda installation, use
   ~compile~ rather than ~setup~. This does the elisp complilation
   with the fresh source code, but doesn't touch your ~init.el~ file
   again.

   NB: It *will not* work if you've already run ~setup~ to do it again
   after updating Agda. The first thing that ~setup~ does is check
   your ~init.el~ file for the presence of an Agda config. If it's
   already there, it does nothing.

### Configuring Agda

Agda's "library system" is... weird, in that it doesn't really have
one. What it _does_ have, is a collection of text files which help the
compiler find the right source files. Here's what you need.

#### `$AGDA_DIR`

By default, it's ~~/.agda~:

> The `AGDA_DIR` defaults to `~/.agda` on unix-like systems[.]

[_The Agda docs_](https://agda.readthedocs.io/en/latest/tools/package-system.html)

`$AGDA_DIR` should contain the following files:

```sh
$ tree ~/.agda
/home/dpitt/.agda
├── defaults
└── libraries
```

##### The `libraries` file

`libraries` _registers_ Agda libraries through a path to an Agda
library file. You can read more
[here](https://agda.readthedocs.io/en/latest/tools/package-system.html).

You'll also want to clone the standard library.

```sh
$ git clone git@github.com:agda/agda-stdlib.git
```

Then, add the path to the stdlib's library file to your libraries
file:

```
$ cat ~/.agda/libraries
/home/dpitt/src/agda-stdlib/standard-library.agdalib
```

##### Defaults

`defaults` contains registered library names which you would like to
be loaded **any** time you open an Agda file. Let's setup the Agda
standard library so it's always availble when opening an Agda file.

```sh
$ echo standard-library >> ~/.agda/defaults
```
