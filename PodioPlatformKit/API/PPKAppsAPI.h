//
//  PPKAppsAPI.h
//  PodioPlatformKit
//
//  Created by Sebastian Rehnby on 15/02/15.
//  Copyright (c) 2015 Citrix Systems, Inc. All rights reserved.
//

#import "PKTBaseAPI.h"

@interface PPKAppsAPI : PKTBaseAPI

+ (PKTRequest *)requestForAppWithID:(NSUInteger)appID;

@end