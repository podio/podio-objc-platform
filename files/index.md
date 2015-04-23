---
layout: default
---
# Working with Files

Files in Podio Platform are represented by the `PKTFile` class in PodioPlatformKit. It will be the type returned for the `files` of any item.

## Download a file

To download the contents of a file from Podio Platform you have two options. The first one is to download the content directly into memory and get an `NSData` object back. This is appropriate for smaller files and can be done with the following code:

{% highlight Swift %}
let file: PKTFile = ...

file.download().
  .onSuccess { (file: PKTFile!) in
    println("Successfully downloaded file with ID: \(file.fileID)")
  }
{% endhighlight %}

The second option is to save the file directly to disk to avoid keeping its data in memory and risking termination by the OS due to excessive memory use. To do this, there is a second download method on `PKTFile` which allows you to specify a save path:

{% highlight Swift %}
let file: PKTFile = ...
let savePath: NSString = ...

file.downloadToFileWithPath(savePath)
  .onSuccess { (PKTResponse: response!) in
    println("Successfully downloaded file to path: \(savePath)")
  }
{% endhighlight %}

## Upload a file

You can easily upload a file to Podio Platform and attach to an item or comment. To do so, just use the upload methods provided by the `PKTFile` class. Here is an example on how you can upload a UIImage instance as a JPEG to Podio on iOS:

{% highlight Swift %}
let image: UIImage = ...
let data: NSData = UIImageJPEGRepresentation(image, 0.8)

PKTFile.uploadWithData(data, fileName:"image.jpg")
  .onSuccess { (file: PKTFile!) in
    println("File uploaded with ID: \(savePath)")
  }
{% endhighlight %}

To add a file to an item, use the `addFile:` method on `PKTItem`:

{% highlight Swift %}
let item: PKTItem = ...
let file: PKTFile = ...

item.addFile(file)

item.save()
  .onSuccess { (response: PKTResponse!) in
    println("Successfully saved item")
  }
{% endhighlight %}