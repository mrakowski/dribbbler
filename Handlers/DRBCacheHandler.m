//
//  DRBCacheHandler.m
//  Dribbbler
//
//  Created by Michael Rakowski on 2/14/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import "DRBCacheHandler.h"

static NSCache *sharedCache;

@implementation DRBCacheHandler

#pragma mark -

+ (NSCache *)sharedCache
{
	@synchronized (self)
	{
		if (!sharedCache)
			sharedCache = [[NSCache alloc] init];
        
		return sharedCache;
	}
}

+ (void)destroyCache
{
	@synchronized (self)
	{
		sharedCache = nil;
	}
}

@end
