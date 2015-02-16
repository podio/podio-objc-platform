# PodioPlatformKit 

PodioPlatformKit is a Objective-C client library for the [Podio Platform API](https://developers.podio.com/). It provides an easy way to build iOS and Mac apps on top of the Podio Platform.

PodioPlatformKit uses ARC and is based on NSURLSession, which means it supports iOS 7.0 and above and Mac OS X 10.9 and above.

PodioPlatformKit is being actively developed by the Podio team. We encourage contributions through pull requests and the Github issue tracker.

## Integrate with an existing project

You use PodioPlatformKit by building the *Framework* target of the scheme.

1. Run `pod install` to install dependencies
2. Open the `PodioPlatformKit.xcworkspace` file created
3. Select the *Framework* scheme, then press `cmd+B` to build.
4. You can now find the built framework as `PodioPlatformKit.framework` in your desktop folder at `~/Desktop`.
5. Drag the framework into your Xcode project
6. Import the umbrella header wherever you want with `#import <PodioPlatformKit/PodioPlatformKit.h>`.
7. Done!

## Using PodioPlatformKit

### Set up your API key and secret

Before you can talk to the Podio Platform API, you need to generate a new API key. You can find instructions on how to do so [here](https://developers.podio.com/api-key).

Once you have a key and secret, you need to configure PodioPlatformKit to use it. To do so, add the following code to your `application:didFinishLaunching:options:` method in your app delegate:

```objective-c
[[PKCClient currentClient] setupWithAPIKey:@"my-api-key" secret:@"my-secret"];
```
	
That's it! You are now good to start using PodioPlatformKit.

## Getting Started & Documentation

You can find a getting started guide and full documentation over at the [PodioKit Github pages](http://podio.github.io/podio-objc-platform/).