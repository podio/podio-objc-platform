//
//  PKTSpace.m
//  PodioPlatformKit
//
//  Created by Sebastian Rehnby on 26/04/15.
//  Copyright (c) 2015 Citrix Systems, Inc. All rights reserved.
//

#import "PKTSpace.h"
#import "PKTClient.h"
#import "PKTOrganizationsAPI.h"
#import "PKTAsyncTask.h"
#import "NSArray+PKTAdditions.h"

@implementation PKTSpace

+ (PKTAsyncTask *)fetchAllSpaces {
  PKTRequest *request = [PKTOrganizationsAPI requestForAllOrganizations];
  PKTAsyncTask *requestTask = [[PKTClient currentClient] performRequest:request];

  return [requestTask map:^id(PKTResponse *response) {
    NSMutableArray *spaces = [NSMutableArray new];
    
    NSArray *orgs = response.body;
    for (NSDictionary *org in orgs) {
      NSArray *spaceDicts = [org objectForKey:@"spaces"];
      
      NSArray *orgSpaces = [spaceDicts pkt_mappedArrayWithBlock:^id(NSDictionary *spaceDict) {
        return [[PKTSpace alloc] initWithDictionary:spaceDict];
      }];
      
      [spaces addObjectsFromArray:orgSpaces];
    }
    
    return spaces;
  }];
}

+ (PKTAsyncTask *)fetchPersonalSpace {
  PKTRequest *request = [PKTRequest GETRequestWithPath:@"/space/personal" parameters:nil];
  
  return [[[PKTClient currentClient] performRequest:request] map:^id(PKTResponse *response) {
    return [[PKTSpace alloc] initWithDictionary:response.body];
  }];
}

+ (PKTAsyncTask *)fetchPublicSpace {
  PKTRequest *request = [PKTRequest GETRequestWithPath:@"/space/public" parameters:nil];
  
  return [[[PKTClient currentClient] performRequest:request] map:^id(PKTResponse *response) {
    return [[PKTSpace alloc] initWithDictionary:response.body];
  }];
}

+ (PKTAsyncTask *)createSpaceWithName:(NSString *)name {
  return [self createWorkspaceWithName:name organizationID:0];
}

@end
