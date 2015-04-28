---
layout: default
---
# PodioPlatformKit

PodioPlatformKit is an Objective-C and Swift client library for [Podio Platform](https://platform.podio.com/). It provides an easy way to integrate your iOS and Mac apps with Podio Platform.

PodioPlatformKit uses ARC and is based on NSURLSession, which means it supports iOS 7.0 and above and Mac OS X 10.9 and above.

PodioPlatformKit is still in beta, so we suggest you use the latest code from the master branch. All examples here will be in Swift, but can be translated directly to Objective-C if preferred.

## Getting Started with Podio Platform

In order to get started using Podio Platform, you need to first create a *project* for your app in the [Podio Platform Console](https://platform.podio.com/). After logging into the console using your Podio account email and password, you will find a guide how to set up your project and templates for use with PodioPlatformKit. We encourage you to follow that guide before continuing to the next step on this page.

## Integrate with an existing project

We encourage you to use [CocoaPods](http://cocoapods.org/) to integrate PodioPlatformKit with your existing project. CocoaPods is a dependency manager for Objective-C and Swift that makes dealing with code dependencies easy.

First, make sure your have integrated CocoaPods with your project. If you have not, there is a great guide available [here](http://guides.cocoapods.org/using/getting-started.html).

Once CocoaPods is installed, add the following line to your `Podfile` to use the latest version:

{% highlight ruby %}
pod 'PodioPlatformKit', :git => 'https://github.com/podio/podio-objc-platform.git', :branch => 'master'
{% endhighlight %}

Then run `pod install` from the command line. Because PodioPlatformKit is not yet a published CocoaPod, you will need to point the `Podfile` directly to the repository URL and branch.

After that you are ready to start using PodioPlatformKit by importing the main header file where you would like to use it in your project:

{% highlight objective-c %}
#import <PodioPlatformKit/PodioPlatformKit.h>
{% endhighlight %}

## Using Swift with PodioPlatformKit

PodioPlatformKit already works great with Swift. All you need to do is to add the following import statement to your [Swift briding header](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/BuildingCocoaApps/MixandMatch.html):

{% highlight objective-c %}
#import <PodioPlatformKit/PodioPlatformKit.h>
{% endhighlight %}

Additionally, to make the PodioPlatformKit API easier to work with in Swift, download and drag the [PodioKitExtensions.swift](https://github.com/podio/podio-objc-core/blob/master/PodioKitCore/Swift/PodioKitExtensions.swift) file into your project. This file extends a few common classes in PodioPlatformKit with additional type information, making them easier to work with from Swift.

## Using PodioPlatformKit

### Set up your API key and secret

Before you can talk to the Podio Platform, you need to find your project API key under "Project Settings" in the [Podio Platform console](https://platform.podio.com).

Once you have a key and secret, you need to configure PodioPlatformKit to use it. To do so, add the following code to your `application(_:didFinishLaunchingWithOptions:)` method in your app delegate:

{% highlight Swift %}
Podio.setupWithAPIKey("my-api-key", secret: "my-secret")
{% endhighlight %}
	
That's it! You are now ready to start using PodioPlatformKit. We recommend taking a look at the ["Building a Bug Tracker App"](/tutorial) tutorial as the first step!