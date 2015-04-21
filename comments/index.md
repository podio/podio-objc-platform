---
layout: default
---
# Working with Comments

## Add a comment

Podio supports commenting on many things including items, tasks, status posts etc. To add a new comment, use the methods provided by the `PKCComment` class:

{% highlight objective-c %}
PKCAsyncTask *task = [PKCComment addCommentForObjectWithText:@"My insightful comment" referenceID:1234 referenceType:PKCReferenceTypeItem];

[task onComplete:^(PKCComment *comment, NSError *error) {
  if (!error) {
    NSLog(@"Comment posted with ID: %@", @(comment.commentID));
  }
}];
{% endhighlight %}