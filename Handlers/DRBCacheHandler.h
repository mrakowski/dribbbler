//
//  DRBCacheHandler.h
//  Dribbbler
//
//  Created by Michael Rakowski on 2/14/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DRBCacheHandler : NSObject

+ (NSCache *)sharedCache;
+ (void)destroyCache;

@end
