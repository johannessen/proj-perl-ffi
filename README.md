Geo::LibProj::FFI
=================

This distribution is a foreign function interface to the [PROJ][]
coordinate transformation library. Please see the PROJ library's
[C function reference][] for further documentation. You should be
able to use those C functions as if they were Perl.

This software is currently incomplete.

The C API has little to do with idiomatic Perl. So this
software is maybe most useful to gain familiarity with the
PROJ API, so that we can perhaps one day have a new module
using a different name that gives us what we *really* need.

[PROJ]: https://proj.org/
[C function reference]: https://proj.org/development/reference/functions.html


Installation
------------

Released versions of [Geo::LibProj::FFI][] may be installed via CPAN:

	cpanm Geo::LibProj::FFI

[![CPAN distribution](https://badge.fury.io/pl/Geo-LibProj-FFI.svg)](https://badge.fury.io/pl/Geo-LibProj-FFI)

To install a development version from this repository, run the following steps:

 1. `git clone https://github.com/johannessen/proj-perl-ffi && cd proj-perl-ffi`
 1. `cpanm Dist::Zilla::PluginBundle::Author::AJNN`
 1. `dzil install`

This is a “Pure Perl” module, so you generally do not need
Dist::Zilla to contribute patches. You can simply clone the
repository and run the test suite using `prove` instead.

[Geo::LibProj::FFI]: https://metacpan.org/release/Geo-LibProj-FFI
[Dist::Zilla]: https://metacpan.org/release/Dist-Zilla
