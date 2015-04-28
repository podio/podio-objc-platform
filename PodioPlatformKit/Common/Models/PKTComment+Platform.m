//
//  PKTComment+Platform.m
//  PodioPlatformKit
//
//  Created by Sebastian Rehnby on 26/04/15.
//  Copyright (c) 2015 Citrix Systems, Inc. All rights reserved.
//

#import "PKTComment+Platform.h"

@implementation PKTComment (Platform)

+ (PKTAsyncTask *)addCommentWithText:(NSString *)text itemID:(NSUInteger)itemID {
  return [PKTComment addCommentForObjectWithText:text referenceID:itemID referenceType:PKTReferenceTypeItem];
}

@end
