---
layout: default
---
# Working with Comments

## Add a comment

Podio supports commenting on many things including items, tasks, status posts etc. To add a new comment, use the methods provided by the `PKTComment` class:

{% highlight Swift %}
PKTComment.addCommentWithText("My insightful comment", referenceID: 1234)
  .onSuccess { (comment: PKTComment!) in
    println("Comment posted with ID: \(comment.commentID)");
  }
{% endhighlight %}