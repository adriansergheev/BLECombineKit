# BLECombineKit

![badge-platforms][] [![badge-ci][]][travis] [![badge-codecov][]][codecov] [![badge-carthage][]][carthage] [![badge-spm][]][spm]

CoreBluetooth abstraction layer for iOS, macOS, TvOS and WatchOS development environments. Powered by Combine.

- SwiftUI compatible
- Apple's APIs dependencies only

Per Apple's docs, https://developer.apple.com/documentation/combine, Combine (and BLECombineKit) is only supported on:

iOS 13.0+
macOS 11.0+ Beta
Mac Catalyst 13.0+
tvOS 13.0+
watchOS 6.0+

# How to use

As simple as creating a CBCentralManager and let the reactive magic of Combine do the rest:

```swift
import CoreBluetooth
import Combine
import BLECombineKit

...

let centralManager = BLECombineKit.buildCentralManager(with: CBCentralManager())

centralManager.scanForPeripherals(withServices: nil, options: nil)
    .first()
    .flatMap { $0.peripheral.discoverServices(serviceUUIDs: nil) }
    .flatMap { $0.discoverCharacteristics(characteristicUUIDs: nil) }
    .flatMap { $0.observeValue() }
    .sink(receiveCompletion: { completion in
        print(completion)
    }, receiveValue: { data in
        print(data.value)
    })
    .store(in: &disposables)
```

You can reference the sample project inside the repository to see the library in action with SwiftUI.

# Installation

## Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.
To integrate CombineBluetoothKit into your Xcode project using Carthage  specify it in your `Cartfile`:
```swift
github "Henryforce/BLECombineKit"
```
Then, run `carthage update` to build framework and drag `CombineBluetoothKit.framework` into your Xcode project.

## Swift Package Manager

In Xcode, select File --> Swift Packages --> Add Package Dependency and then add the following url:

```swift
https://github.com/Henryforce/BLECombineKit
```

[badge-platforms]: https://img.shields.io/badge/platforms-macOS%20%7C%20iOS%20%7C%20tvOS%20%7C%20watchOS-lightgrey.svg
[badge-codecov]: https://codecov.io/gh/codecov/example-swift/branch/master/graphs/badge.svg
[badge-ci]: https://travis-ci.com/Henryforce/BLECombineKit.svg?branch=master
[badge-carthage]: https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat
[badge-spm]: https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg

[codecov]: https://codecov.io/gh/Henryforce/BLECombineKit/branch/master
[travis]: https://travis-ci.com/Henryforce/BLECombineKit
[carthage]: https://github.com/Carthage/Carthage
[spm]: https://github.com/apple/swift-package-manager
