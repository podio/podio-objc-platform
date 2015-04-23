---
layout: default
---
# Authentication & Session Management

Podio Platform supports multiple ways of authenticating a client. The client is considered to be authenticated once it has obtained a valid OAuth2 token. You can easily check if the client is authenticated:

{% highlight Swift %}
if Podio.isAuthenticated() {
  // The client is authenticated
}
{% endhighlight %}

The authentication state is kept by a singleton instance of [`PKTClient`](https://github.com/podio/podio-objc/blob/master/PodioPlatformKit/Core/PKTClient.h).

Whenver the the authentication state of the client changes, meaning the token is updated, the `PKTClientAuthenticationStateDidChangeNotification` notification is posted. This can be useful to observe for changing the state of your UI or show a login screen.

## Authenticate as a user

This option is great when you want to have every user of your client app to log in using their own Podio account and as such have access to the content of their entire Podio account.

Here is how to authenticate as a user:

{% highlight Swift %}
let authTask = Podio.authenticateAsUserWithEmail("myname@mydomain.com", password:"p4$$w0rD")

task.onComplete { (response: PKTResponse?, error: NSError?) in
  if let error == error {
    // Failed to authenticate, double check your credentials
  } else {
    // Successfully authenticated
  }
}
{% endhighlight %}

## Saving and restoring a session across app launches

If your app is terminated, the shared `PKTClient` instance will no longer have a token once your app is re-launced. This means that if you want the previous user session to live on, you need to store the authentication token in the Keychain when it changes and restore it from the Keychain when the app is re-launced. Luckily, PodioPlatformKit can take care of that for you!

PodioPlatformKit provides a protocol called `PKTTokenStore` and a concrete class `PKTKeychainTokenStore` which stores the token in the iOS or OS X Keychain. All you need to do is add the following line after your call to `setupWithAPIKey(_:secret:)` in `application(_:didFinishLaunchingWithOptions:)`:

{% highlight objective-c %}
Podio.setupWithAPIKey("my-project-api-key", secret: "my-project-secret")
Podio.automaticallyStoreTokenInKeychainForCurrentApp()
// or
Podio.automaticallyStoreTokenInKeychainForServiceWithName("MyApp")
{% endhighlight %}

This line takes care of configuring the shared `PKTClient` instance with an instance of `PKTKeychainTokenStore` and restores any previous token from the Keychain. If you want to expliticly restore the token, you can call the `restoreTokenIfNeeded()` method on `PKTClient` directly. If you are feeling real adventurous you can even implement your own class conforming to `PKTTokenStore` to store the token anywhere other than the Keychain. You can then set the `tokenStore` property on the shared `PKTClient` instance like:

{% highlight objective-c %}
PKTClient.currentClient().tokenStore = MyOwnTokenStore()
PKTClient.currentClient().restoreTokenIfNeeded()
{% endhighlight %}

Note that we would not recommend doing this as the Keychain is the most secure container available.