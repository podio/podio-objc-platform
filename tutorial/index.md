---
layout: default
---

# Tutorial: Building a Bug Tracker App

This tutorial will walk your through the steps of creating a simple bug tracker app using Podio Platform. It will, using Swift and PodioPlatformKit, demonstrate some of the possibilities of Podio Platform:

1. Creating a "Bug" template using the Podio Platform console
2. Configuring PodioPlatformKit SDK for your Xcode project
3. Signing in as a user of your app
4. Creating new "bugs" using your Bugs template
5. Listing and filtering of bugs
6. Uploading and associating files to a bug
7. Collaborating with other users on bugs

## 1. Creating a "Bug" template using Podio Platform Console

The first step is to set up a *project* for your app in the [Podio Platform Console](https://platform.podio.com) and integrate the SDK into your Xcode project. You can find instructions on how to do this by reading the ["Getting Started"]({{ site.baseurl}}/).

## 2. Configuring PodioPlatformKit SDK for your Xcode project

After integrating PodioPlatformKit with your Xcode project using CocoaPods and importing the PodioPlatformKit umbrella header in your Swift bridging header, you need to configure PodioPlatformKit to use your project API keys for Podio Platform. To do so, add the following lines to your `application(_:didFinishLaunchingWithOptions:)` method in your app delegate:

{% highlight Swift %}
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
  Podio.setupWithAPIKey("my-project-api-key", secret: "my-project-secret") // 1
  Podio.automaticallyStoreTokenInKeychainForCurrentApp()                   // 2

  return true
}
{% endhighlight %}

**Line 1** configures PodioPlatformKit to be able to uniquely identify your app for any calls to Podio Platform.

**Line 2** is an optional configuration call. It ensures that whenever a user is authenticated, the session information (such as access tokens) will be persisted in the excrypted system Keychain automatically, and restored upon application launch. This takes away the manual effort of saving/restoring sessions.

## 3. Signing in as a user of your app

In order to identify the user of your application, you typically want them to sign into your app. The common way to do this is to present a form with two fields: One for the email and one for the password. Because Podio Platform is based on the users Podio identity, all that a user of your application needs to do is provide their Podio username and password through such a login form.

Once the user has provided their credentials, you can initiate a session in PodioPlatformKit by calling the `authenticateAsUserWithEmail(_:password)` method:

{% highlight Swift %}
@IBAction func login(sender: UIButton!) {
  let email = self.emailTextField.text;
  let password = self.passwordTextField.text;
  
  Podio.authenticateAsUserWithEmail(email, password: password)
    .onSuccess { (response: PKTResponse!) in
      println("Successfully logged in")
    }
    .onError { error in
      println("Failed to log in: \(error.localizedDescription)")
    }
}
{% endhighlight %}

We can see here that `authenticateAsUserWithEmail(_:password)` returns a `PKTAsyncTask` object, onto which we can then register `onSuccess(_)`, `onError(_)` or `onComplete(_)` handlers. This pattern is used throught the SDK, and is explained in greater detail in the [Basic principles of asynchronicity]({{ site.baseurl}}/async) section.

## 4. Creating new bugs using your Bug template

In order to report bugs from your app, you need to be able to create new bugs from the app. We already set up a "Bug" template, so the only thing we need to do from the client app is to start creating instances of this template, a.k.a the items themselves.

In Podio Platform, items are stored in [spaces](https://platform.podio.com/docs/spaces). Spaces are containers of items and people, and the items in a space can be accessed by the people in that space. This is a good way to group information with the people who should be able to access it. `createInSpaceWithID(_)` function will create a new bug instance in a space with the given ID, while the `save()` function will save changes to an existing item.

In order to create a new bug, you just create an item using the "Bug" template:

{% highlight Swift %}  
let templateID = 12345 // The ID of the "Bug" template. You find the ID if the template you create in Podio Platform Console.
let bug = PKTItem(templateID: templateID)

println("Bug ID: \(bug.itemID)") // => "Bug ID: 0"

bug["title"] = "Button is not working"                  // Single-line text field
bug["reproduce_steps"] = "1. Open app\n2. Click button" // Multi-line text field
bug["status"] = "Open"                                  // Category field with options "Open" or "Fixed"
bug["priority"] = "High"                                // Category field with options "High", "Medium", "Low"

let space = ... // A space retrieved from somewhere

// Create the bug in a space
bug.createInSpaceWithID(space.spaceID)
  .onSuccess { [weak bug] (savedBug: PKTItem!) in
    println("Bug ID: \(bug.itemID)") // => "Bug ID: 1234"
  }
  .onError { error in
    println("Failed to save bug: \(error.localizedDescription)")
  }
{% endhighlight %}

If you want to update a particular field of the bug, just set a new value and call `save()`:

{% highlight Swift %}  
bug["status"] = "Fixed"

bug.save()
  .onSuccess { (savedBug: PKTItem!) in
    let savedStatus = savedBug["status"]
    println("Bug status: \(savedStatus)") // => "Bug status: Fixed"
  }
  .onError { error in
    println("Failed to save bug: \(error.localizedDescription)")
  }
{% endhighlight %}

## 5. Listing and filtering of bugs

To be able to keep track of bugs that needs fixing from within your app, you need to be able to retrieve a list of the existing bugs, but only returning those that have their "status" field set to "Open". 

You can do this using the Podio Platform filtering functionality:

{% highlight Swift %}
let templateID = 12345 // You find the ID if the template you create in Podio Platform Console
let filter = PKTItemFilters().withCategory("status", text: "Open")

PKTItem.fetchItemsInSpaceWithID(spaceID, templateID: templateID, offset: 0, limit: 20, sortBy: "created_on", descending: true, filters:filters)
  .onSuccess { (openBugs: [PKTItem]!) in
    println("Found \(count(openBugs)) open bugs")
  }
  .onError { error in
    println("Failed to fetch bugs: \(error.localizedDescription)")
  }
{% endhighlight %}

## 6. Uploading and associating files to a bug

Podio Platform provides support for uploading, storing and associating files with any items created. For our bug tracker, we might want to associate a test file needed to reproduce the bug. Associating a file with a bug is extremely easy using PodioPlatformKit, and is a two step process; first you need to upload the file, then attach it to the bug item:

{% highlight Swift %}
PKTFile.uploadWithPath("/tmp/some/local/file.docx")
  .pipe { (file: PKKFile!) in
    // pipe() is used to chain operations, by providing the result of the first operation
    // to be optionally used to create the second one
    return file.attachWithReferenceID(bug.itemID, referenceType: .Item)
  }
  .onSuccess { (response: PKTResponse!) in
    println("File successfully uploaded and attached!")
  }
  .onError { error in
    println("Failed to fetch bugs: \(error.localizedDescription)")
  }
{% endhighlight %}

Here we can clearly see the advantages of using `PKTAsyncTask` to manage our completion handlers. We can use the `pipe(_)` combinator function to use the result of the first request to create a subsequent request, and only handle the success case if they both succeed or the error case if either of them fail. More details on `PKTCAsyncTask` and combinator functions are available in the [Basic principles of asynchronicity]({{ site.baseurl}}/async) section.

## 7. Collaborating with other users on bugs

Like with any good bug tracking tool, you need your entire team to use it for it to be useful. You want to be able to assign and re-assign a bug to any member of your team and comment on the bug. As mentioned previously, people on Podio Platform are organized into *spaces* together with the items they can collaborate on. So in order to get your team on board with using your bug tracker, you need to do two things:

1. Add your team members to the space
2. Change the assignee of your bug to be a member of the space

The first step can be easily accomplished using the following call:

{% highlight Swift %}
let space: PKKSpace = .. // A PKKSpace instance retrieved from somewhere

space.addMemberWithEmail("jon@podio.com", role: .Regular)
  .onSuccess { (response: PKTResponse!) in
    println("Member successfully added")
  }
  .onError { error in
    println("Failed to fetch bugs: \(error.localizedDescription)")
  }
{% endhighlight %}

To assign the new member to a specific bug, just update the "assignee" field of the bug:

{% highlight Swift %}
bug["assignee"] = profile
// or
bug["assignee"] = profile.profileID

bug.save()
  .onSuccess { (savedBug: PKTItem!) in
    println("Bug saved")
  }
  .onError { error in
    println("Failed to save bug: \(error.localizedDescription)")
  }
{% endhighlight %}

Another way to collaborate around your items is by adding comments. This is very easy using the `PKTComment` class:

{% highlight Swift %}
PKTComment.addCommentWithText("This looks great!", itemID: bug.itemID)
  .onSuccess { (comment: PKTComment!) in
    println("Comment added with ID: \(comment.commentID)")
  }
  .onError { error in
    println("Failed to add comment: \(error.localizedDescription)")
  }
{% endhighlight %}

Comments on an item can be retrieved from the `comments` property of `PKTItem`.
