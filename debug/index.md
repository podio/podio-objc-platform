---
layout: default
---
# Debugging & Errors

Error handling in PodioPlatformKit follows the normal Cocoa error handling patterns, which means it uses exceptions for programmatic errors and `NSError` for runtime errors. For errors that occur during a network requests, the error is provided in the `PKCRequestCompletionBlock` callback together with the [PKCResponse](https://github.com/podio/podio-objc/blob/master/PodioPlatformKit/Core/PKCResponse.h) object.

You can inspect the `statusCode`  and `body` properties of the response object to determine if the error was a client or server side error.