---
layout: default
---
# Working with Apps & Items

## Fetching items

[Apps](https://developers.podio.com/doc/applications) and [items](https://developers.podio.com/doc/items) are the corner stones of the Podio platform. An app is a container of multiple items. You can think of an app as a set of fields of different types, like the columns in a spreadsheet. The items in that app are then equivalent to the rows in the spreadsheet, i.e. the entires with one or more values for each field.

There are mupltiple types of fields in an app. A field supports a single or multiple values depending on its type. The available field types and their supported values are:

* **Text**: Single value of `NSString`
* **Category**: Multiple values of `NSNumber` (the option ID) or `PKCCategoryOption`
* **Date**: Single value of `PKCDateRange` or an `NSDate` representing the start date and time
* **Relationship**: Multiple values of `PKCItem`
* **Contact**: Multiple value of `PKCProfile`
* **Number**: Single value of `NSNumber`
* **Link**: Single value of `PKCEmbed`
* **Image**: Multiple values of `PKCFile`
* **Money**: Single value of `PKCMoney`
* **Progress**: Single value of `NSNumber` (value between 0-100)
* **Calculation**: Single value of `NSDictionary` (read-only)
* **Map**: Single value of `NSString`
* **Duration**: Single value of `PKCDuration`

To fetch an item, use the class method on `PKCItem`:

{% highlight objective-c %}
[[PKCItem fetchItemWithID:1234] onComplete:^(PKCItem *item, NSError *error) {
  if (!error) {
    NSLog(@"Fetched item with ID: %@", @(item.itemID));
  }
}];
{% endhighlight %}

To fetch a list of items in an app, there is another handy method on `PKCItem`:

{% highlight objective-c %}
[[PKCItem fetchItemsInAppWithID:1234 offset:0 limit:30] onComplete:^(NSArray *items, NSUInteger filteredCount, NSUInteger totalCount, NSError *error) {
  if (!error) {
    NSLog(@"Fetched %@ items out of a total of @%", @(filteredCount), @(totalCount));
  }
}];
{% endhighlight %}

To access the values of an item, you can either use the `-valueForField:(NSString *)externalID` method on `PKCItem`, or use subscripting directly:

{% highlight objective-c %}
PKCItem *item = ...

PKCMoney *amount = item[@"amount"];
// Is equivalient to
PKCMoney *amount2 = [item valueForField:@"amount"];
{% endhighlight %}

The same works for updating field values:

{% highlight objective-c %}
PKCItem *item = ...

PKCMoney *amount = [PKCMoney alloc] initWithAmount:@123 currency:@"USD"];

item[@"amount"] = amount;
// Is equivalient to:
[item setValue:amount forField:@"amount"];
{% endhighlight %}

## Creating a new item

To create an item, simply use the class methods on `PKCItem`:

{% highlight objective-c %}
PKCItem *item = [PKCItem itemForAppWithID:1234];
item[@"title"] = @"My first item";
item[@"description"] = @"This is my first item of many.";

[[item save] onComplete:^(PKCResponse *response, NSError *error) {
  if (!error) {
    NSLog(@"Item saved with ID: %@", @(item.itemID));
  } else {
    // Handle error...
  }
}];
{% endhighlight %}

## Updating an existing item

To update an item, use the same `save` method as described in *Creating a new item* above. PodioPlatformKit will know if the item already exists and needs to be created, or if it should only be updated.