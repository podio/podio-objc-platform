//
//  PKTItem+Platform.h
//  PodioPlatformKit
//
//  Created by Sebastian Rehnby on 26/04/15.
//  Copyright (c) 2015 Citrix Systems, Inc. All rights reserved.
//

#import "PKTItem.h"

@class PKTAsyncTask, PKTItemFilters;

@interface PKTItem (Platform)

/**
 *  Retrieve existing items in a given space for a specific template.
 *
 *  @param spaceID    The space ID
 *  @param templateID The template ID of the template used to create these items.
 *  @param offset     The page offset. Used for pagination.
 *  @param limit      The page limit. Used for pagination. Passing 0 will use the default page size.
 *  @param sortBy     Sort order of the returned items. Permitted values available here https://developers.podio.com/doc/filters
 *  @param descending YES if the items should be returned in descending order, NO if ascending.
 *  @param filters    Optional filters to to limit the set of items returned.
 *
 *  @return A task delivering the items on success.
 */
+ (PKTAsyncTask *)fetchItemsInSpaceWithID:(NSUInteger)spaceID templateID:(NSUInteger)templateID offset:(NSUInteger)offset limit:(NSUInteger)limit sortBy:(NSString *)sortBy descending:(BOOL)descending filters:(PKTItemFilters *)filters;

@end
