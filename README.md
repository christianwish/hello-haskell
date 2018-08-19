# hello-haskell

Haskell - minimum server setup with [Happstack](http://happstack.com/docs/crashcourse/index.html)

install dependencies:
```sh
$ cd hello-haskell
$ cabal sandbox init
$ cabal install --only-dependencies --enable-tests
```

start server:
```sh
$ cabal run
# -> http://localhost:8000/
```

run tests:
```sh
$ cabal test
```
requires:

* [Haskell Platform](https://www.haskell.org/platform/)
* [Cabal](https://www.haskell.org/cabal/) (probably already included in Haskell Platform!)

#### alternative setup with stack

build: `stack build`
build & test & create docs: `stack build --test --haddock --fast`
run built executable: `stack exec hello-haskell`

#### running as a script

`stack runhaskell src/Main.hs`