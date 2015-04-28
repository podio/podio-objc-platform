//
//  PKTItem+Platform.m
//  PodioPlatformKit
//
//  Created by Sebastian Rehnby on 26/04/15.
//  Copyright (c) 2015 Citrix Systems, Inc. All rights reserved.
//

#import "PKTItem+Platform.h"
#import "PKTAsyncTask.h"
#import "PKTItemFilters.h"

@implementation PKTItem (Platform)

+ (PKTAsyncTask *)fetchItemsInSpaceWithID:(NSUInteger)spaceID templateID:(NSUInteger)templateID offset:(NSUInteger)offset limit:(NSUInteger)limit sortBy:(NSString *)sortBy descending:(BOOL)descending filters:(PKTItemFilters *)filters {
  return [self fetchItemsInAppWithID:templateID spaceID:spaceID offset:offset limit:limit sortBy:sortBy descending:descending filters:filters.filtersDictionary];
}

@end
