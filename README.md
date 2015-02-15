# PodioPlatformKit 

PodioPlatformKit is a Objective-C client library for the [Podio Platform API](https://developers.podio.com/). It provides an easy way to build iOS and Mac apps on top of the Podio Platform.

PodioPlatformKit uses ARC and is based on NSURLSession, which means it supports iOS 7.0 and above and Mac OS X 10.9 and above.

PodioPlatformKit is being actively developed by the Podio team. We encourage contributions through pull requests and the Github issue tracker.

## Integrate with an existing project

We encourage you to use [CocoaPods](http://cocoapods.org/) to integrate PodioPlatformKit with your existing project. CocoaPods is a dependency manager for Objective-C that makes dealing with code dependencies easy.

First, make sure your have integrated CocoaPods with your project. If you have not, there is a great guide available [here](http://guides.cocoapods.org/using/getting-started.html).

Once CocoaPods is installed, add the following line to your `Podfile` to use the latest stable release:

```ruby
pod 'PodioPlatformKit', '~> 1.0'
```

Then run `pod install` from the command line.

After that you are ready to start using PodioPlatformKit by importing the main header file where you would like to use it in your project:

```objective-c
#import <PodioPlatformKit/PodioPlatformKit.h>
```

Alternatively, you can use the PodioPlatformKit as a framework.

## Using PodioKit

### Set up your API key and secret

Before you can talk to the Podio Platform API, you need to generate a new API key. You can find instructions on how to do so [here](https://developers.podio.com/api-key).

Once you have a key and secret, you need to configure PodioPlatformKit to use it. To do so, add the following code to your `application:didFinishLaunching:options:` method in your app delegate:

```objective-c
[[PKTClient currentClient] setupWithAPIKey:@"my-api-key" secret:@"my-secret"];
```
	
That's it! You are now good to start using PodioPlatformKit.

## Getting Started & Documentation

You can find a getting started guide and full documentation over at the [PodioKit Github pages](http://podio.github.io/podio-objc-platform/).