# Automated jQuery tests with QUnit

## Installation

    (sudo) gem install hanoi

## Crash Course

    hanoi         # prepare the target directory
    rake test:js  # run the tests

## How To Use

Prepare the target directory, you can use **one** of the following options:

    hanoi
    hanoi .
    hanoi /path/to/project

You need a valid [Rake](http://rake.rubyforge.org/) installation to run your tests:

    rake test:js

You can specify to run the test against one or more browsers:

    rake test:js BROWSERS=firefox,ie,safari

You can specify to run only certain tests:

    rake test:js TESTS=path/to/first_test.js,path/to/second_test.js

You can combine both `BROWSERS` and `TESTS` configurations.

## Structure

The `hanoi` executable will create the following structure:

    Rakefile
    test/
      javascript/
        assets/
          jquery.js
          testrunner.js
          testsuite.css
        example_test.js
        fixtures/
          example_fixtures.html
        templates/
          test_case.erb

* `Rakefile` creates a fresh Rake file, **you have to edit** it according to your setup
* `test` Hanoi creates it if missing, otherwise will choose between existing `test` or `spec` paths
* `javascript` is the root directory of your tests
* `assets` contains the [jQuery](http://jquery.com) and [QUnit](http://docs.jquery.com/QUnit) source file and a css.
  Place your assets in this directory, it's mapped as root path `/`.
* `example_test.js` is a sample of a real test case.
* `templates` contains the template file for your tests. You shouldn't edit it, if you don't know the risk.
* `fixtures` contains all the HTML fixtures, each file will be injected into the proper case.

By convention, your `test/javascript` folder **should reflect** the structure of your source directory,
appending the `_test.js` suffix to each test case and the `_fixtures.html` to each fixture file.

Example:

    src/
      directory_a/
        directory_b/
          file_3.js
        file_2.js
      file_1.js
    test/
      javascript/
        directory_a/
          directory_b/
            file_3_test.js
          file_2_test.js
        file_1_test.js
        fixtures/
          directory_a/
            directory_b/
              file_3_fixtures.html
          file_1_fixtures.html

You have probably noticed that `file_2_fixtures.html` is missing, this because **fixtures are optional**.

## Browsers & Platforms

### Platforms:

* Mac OS X
* Windows
* Linux

### Browsers:

* Chrome (Mac OS X and Windows)
* Firefox
* Internet Explorer (Windows)
* Konqueror (Linux)
* Opera
* Safari (Mac OS X and Windows)
* Webkit (Mac OS X and Windows)

#### Webkit on Mac OS X

To solve the annoying start page issue run: `defaults write org.webkit.nightly.WebKit StartPageDisabled -bool YES`

#### Webkit on Windows

Webkit hasn't a default path on Windows, please put under `C:\Program Files`, or specify the `WEBKIT_HOME` env var.

## Acknowledgements

The Ruby libraries of Hanoi are a customization of the `jsblib.rb`, courtesy of the [Prototype](http://prototypejs.org) team.

Hanoi runs a customized version of `QUnit`, courtesy of the [jQuery](http://jquery.com) team.

## Repository

    git clone git://github.com/jodosha/hanoi.git

## Copyright

(c) 2009 - 2010 Luca Guidi - [http://lucaguidi.com](http://lucaguidi.com), released under the MIT license
