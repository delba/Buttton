<h1 align="center">Buttton</h1>
<p align="center">
  <a href="https://travis-ci.org/delba/Buttton"><img alt="Travis Status" src="https://img.shields.io/travis/delba/Buttton.svg"/></a>
  <a href="https://img.shields.io/cocoapods/v/Buttton.svg"><img alt="CocoaPods compatible" src="https://img.shields.io/cocoapods/v/Buttton.svg"/></a>
  <a href="https://github.com/Carthage/Carthage"><img alt="Carthage compatible" src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"/></a>
</p>

The missing `(set)backgroundColor|cornerRadius|borderWidth|borderColor(_:forState)` methods.

## Usage

```swift
import Buttton

let button = UIButton()
button.clipsToBounds = true

button.setBackgroundColor(.clearColor(), forState: .Normal)
button.setBorderRadius(44, forState: .Normal)
button.setBorderWidth(1, forState: .Normal)

button.setBorderColor(.greenColor(), forState: .Normal)
button.setBorderColor(.redColor(), forState: .Highlighted)
```

## Installation

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate Buttton into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "delba/Buttton"
```

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects.

You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate Buttton into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
use_frameworks!

pod 'Buttton'
```

## License

Copyright (c) 2015 Damien (http://delba.io)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
