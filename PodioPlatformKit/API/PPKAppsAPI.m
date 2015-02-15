//
//  PPKAppsAPI.m
//  PodioPlatformKit
//
//  Created by Sebastian Rehnby on 15/02/15.
//  Copyright (c) 2015 Citrix Systems, Inc. All rights reserved.
//

#import "PPKAppsAPI.h"

@implementation PPKAppsAPI

+ (PKTRequest *)requestForAppWithID:(NSUInteger)appID {
  NSParameterAssert(appID > 0);
  
  return [PKTRequest GETRequestWithPath:PKTRequestPath(@"/app/%lu", (unsigned long)appID) parameters:nil];
}

@end
