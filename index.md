---
layout: default
---
# PodioPlatformKit

PodioPlatformKit is an Objective-C client library for the [Podio Platform](https://platform.podio.com/). It provides an easy way to integrate your iOS and Mac apps with Podio.

PodioPlatformKit uses ARC and is based on NSURLSession, which means it supports iOS 7.0 and above and Mac OS X 10.9 and above.

PodioPlatformKit is still in beta, so we suggest you use the latest code from the master branch.

## Integrate with an existing project

We encourage you to use [CocoaPods](http://cocoapods.org/) to integrate PodioPlatformKit with your existing project. CocoaPods is a dependency manager for Objective-C that makes dealing with code dependencies easy.

First, make sure your have integrated CocoaPods with your project. If you have not, there is a great guide available [here](http://guides.cocoapods.org/using/getting-started.html).

Once CocoaPods is installed, add the following line to your `Podfile` to use the latest version:

{% highlight ruby %}
pod 'PodioPlatformKit', :git => 'https://github.com/podio/podio-objc-platform.git', :branch => 'master'
{% endhighlight %}

Then run `pod install` from the command line.

After that you are ready to start using PodioPlatformKit by importing the main header file where you would like to use it in your project:

{% highlight objective-c %}
#import <PodioPlatformKit/PodioPlatformKit.h>
{% endhighlight %}

Alternatively, you can use the PodioPlatformKit source directly by copying the source files directly into your Xcode project.

## Using PodioPlatformKit

### Set up your API key and secret

Before you can talk to the Podio API, you need to generate a new API key for your application from your "Account Settings" page on Podio. You can find instructions on how to do so [here](https://developers.podio.com/api-key).

Once you have a key and secret, you need to configure PodioPlatformKit to use it. To do so, add the following code to your `application:didFinishLaunching:options:` method in your app delegate:

{% highlight objective-c %}
[Podio setupWithAPIKey:@"my-api-key" secret:@"my-secret"];
{% endhighlight %}
	
That's it! You are now good to start using PodioPlatformKit.