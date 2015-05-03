//
//  PKTSpace.h
//  PodioPlatformKit
//
//  Created by Sebastian Rehnby on 26/04/15.
//  Copyright (c) 2015 Citrix Systems, Inc. All rights reserved.
//

#import "PKTWorkspace.h"

@interface PKTSpace : PKTWorkspace

/**
 *  Returns an array of spaces (PKTSpace) the user is a member of.
 *
 *  @return An task providing the spaces on success.
 */
+ (PKTAsyncTask *)fetchAllSpaces;

/**
 *  Fetches the personal space of the user. The name of a personal
 *  space will be "{user_id}-{project_id}-personal".
 *
 *  @return A task providing the personal space on success.
 */
+ (PKTAsyncTask *)fetchPersonalSpace;

/**
 *  Creates a new space with a given name.
 *
 *  @return A task which succeeds if the space is created.
 */
+ (PKTAsyncTask *)createSpaceWithName:(NSString *)name;

@end
