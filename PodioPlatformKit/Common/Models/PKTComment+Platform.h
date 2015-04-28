//
//  PKTComment+Platform.h
//  PodioPlatformKit
//
//  Created by Sebastian Rehnby on 26/04/15.
//  Copyright (c) 2015 Citrix Systems, Inc. All rights reserved.
//

#import "PKTComment.h"

@interface PKTComment (Platform)

+ (PKTAsyncTask *)addCommentWithText:(NSString *)text itemID:(NSUInteger)itemID;

@end
