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

@end
