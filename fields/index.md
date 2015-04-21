---
layout: default
---
# Item Field Examples

An app item can have any number of fields, and any field can have one or multiple values depending on the type of field. The following field types are provided by the Podio API:

* Text
* Category
* Date
* Relationship
* Contact
* Number
* Link
* Image
* Money
* Progress
* Calculation
* Map
* Duration

Below, we will cover each of them in detail and how to use them. Fields values can be easily accessed by Objective-C subscripting syntax, or through the `valueForField:` or `setValue:forField:` methods on `PKCItem`.

## Text field

A text field can hold a single value of type `NSString`. To read the value from an item, use:

{% highlight objective-c %}
NSString *title = item[@"title"];  // 'title' is a text field
{% endhighlight %}

To set it, do the opposite:

{% highlight objective-c %}
item[@"title"] = @"This is a new item title";
{% endhighlight %}

## Category field

A category field can hold one or multiple values of type `PKCCategoryOption`. To read the value from an item, use:

{% highlight objective-c %}
PKCCategoryOption *option = item[@"status"]; // 'status' is a category field
{% endhighlight %}

To set it, you can either provide an instance of `PKCCategoryOption` or optionally provide the option ID directly if you know it:

{% highlight objective-c %}
PKCCategoryOption *option = ...;
item[@"status"] = option;             // Give the full option object
// or...
item[@"status"] = @(option.optionID)  // Only give the option ID
{% endhighlight %}

## Date field

A date represents a single date or a start/end date pair, represented by a single value of type `PKCDateRange`. To read the value from an item, use:

{% highlight objective-c %}
PKCDateRange *dates = item[@"meeting_date"]; // 'meeting_date' is a date field
{% endhighlight %}

To set it, you can either provide an instance of `PKCDateRange`, which supports both start and end dates, or optionally provide only an `NSDate` which will then be used as the start date for the field:

{% highlight objective-c %}
PKCDateRange *dates = ...;
item[@"meeting_date"] = dates;         // Give the full date range object
// or...
item[@"meeting_date"] = [NSDate date]; // Give the current time as an NSDate directly
{% endhighlight %}

## Relationship field

A relationship field hold references to a single or multiple referenced items. It support a single or multiple values of type `PKCItem`. To read the value from an item, use:

{% highlight objective-c %}
PKCItem *item = item[@"project"]; // 'project' is a relationship field
{% endhighlight %}

You can set it by providing an instance of `PKCItem`:

{% highlight objective-c %}
PKCItem *referencedItem = ...;
item[@"project"] = referencedItem;

// or add multiple...
PKCItem *referencedItem2 = ...;
PKCItem *referencedItem3 = ...;
[item addValue:referencedItem2 forField:@"project"];
[item addValue:referencedItem3 forField:@"project"];
{% endhighlight %}

## Contact field

A contact field can hold one or multiple values of type `PKCProfile`. To read the value from an item, use:

{% highlight objective-c %}
PKCProfile *contact = item[@"responsible"]; // 'responsible' is a contact field
{% endhighlight %}

To set it, provide an instance of `PKCProfile`:

{% highlight objective-c %}
PKCProfile *contact = ...;
item[@"responsible"] = contact;
{% endhighlight %}

## Number field

A contact field can hold a single value of type `NSNumber`. To read the value from an item, use:

{% highlight objective-c %}
NSNumber *totalNum = item[@"total"]; // 'count' is a number field
{% endhighlight %}

To set it, provide an instance of `NSNumber`:

{% highlight objective-c %}
item[@"total"] = @1234.43;
{% endhighlight %}

## Link field

A link field can hold one or multiple values of type `PKCEmbed`. To read the value from an item, use:

{% highlight objective-c %}
PKCEmbed *link = item[@"link"]; // 'link' is a link field
{% endhighlight %}

To set it, provide an instance of `PKCEmbed`:

{% highlight objective-c %}
PKCEmbed *link = ...;
item[@"link"] = link;
{% endhighlight %}

## Image field

An image field can hold one or multiple values of type `PKCFile`. To read the value from an item, use:

{% highlight objective-c %}
PKCFile *imageFile = item[@"photos"]; // 'photos' is an image field
{% endhighlight %}

To set it, provide an instance of `PKCFile`, for example after uploading an image:

{% highlight objective-c %}
PKCFile *file = ...;
item[@"photos"] = file;
{% endhighlight %}

## Money field

A money field has an amount value in the form of a number, and and a currency string. It is represented by a single value of type `PKCMoney`. To read the value from an item, use:

{% highlight objective-c %}
PKCMoney *totalAmount = item[@"total"]; // 'total' is a money field
{% endhighlight %}

To set it, provide an instance of `PKCMoney`:

{% highlight objective-c %}
PKCMoney *totalAmount = ...;
item[@"total"] = totalAmount;
{% endhighlight %}

## Progress field

A contact field can hold a single value of type `NSNumber`, representing a progress value between 0-100. To read the value from an item, use:

{% highlight objective-c %}
NSNumber *progress = item[@"completion"]; // 'completion' is a progress field
{% endhighlight %}

To set it, provide an instance of `NSNumber`:

{% highlight objective-c %}
item[@"completion"] = @50;  // Set the progress field to 50% completion
{% endhighlight %}

## Calculation field

Calulation fields are read-only and holds a single NSDictionary value. The value should be interpreted differenty depending on the return type setting of the field.

{% highlight objective-c %}
NSDictionary *value = item[@"calculation"]; // 'calculation' is a calculation field
{% endhighlight %}


## Map field

A map field can hold a single value of type `NSString`, providing a textual description of the location. To read the value from an item, use:

{% highlight objective-c %}
NSString *location = item[@"location"]; // 'location' is a map field
{% endhighlight %}

To set it, do the opposite:

{% highlight objective-c %}
item[@"location"] = @"Vesterbrogade 34, Copenhagen";
{% endhighlight %}

## Duration field

A duration field value is described by three components; hours, minutes and seconds, which is represented by the value class `PKCDuration`. The field holds a single value of type `PKCDuration`. To read the value from an item, use:

{% highlight objective-c %}
PKCDuration *timeSpent = item[@"time_spent"]; // 'time_spent' is a duration field
{% endhighlight %}

To set it, provide an instance of `PKCDuration`:

{% highlight objective-c %}
item[@"total"] = [PKCDuration alloc] initWithHours:3 minutes:20 seconds:12];
// or...
item[@"total"] = [PKCDuration alloc] initWithTotalSeconds:3645];
{% endhighlight %}