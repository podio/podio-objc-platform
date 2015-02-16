//
//  PPKAppsAPI.m
//  PodioPlatformKit
//
//  Created by Sebastian Rehnby on 15/02/15.
//  Copyright (c) 2015 Citrix Systems, Inc. All rights reserved.
//

#import "PPKAppsAPI.h"

@implementation PPKAppsAPI

+ (PKCRequest *)requestForAppWithID:(NSUInteger)appID {
  NSParameterAssert(appID > 0);
  
  return [PKCRequest GETRequestWithPath:PKCRequestPath(@"/app/%lu", (unsigned long)appID) parameters:nil];
}

@end
