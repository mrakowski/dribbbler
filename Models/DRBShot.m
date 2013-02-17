//
//  DRBShot.m
//  Dribbbler
//
//  Created by Michael Rakowski on 2/14/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import "DRBShot.h"

@implementation DRBShot

#pragma mark - JSON processing

+ (DRBShot *)shotFromJSONDictionary:(NSDictionary *)inJSONDictionary
{
	return [[[self alloc] initWithJSONDictionary:inJSONDictionary] autorelease];
}

+ (NSArray *)shotArrayFromJSONArray:(NSArray *)inJSONArray
{
    NSMutableArray *tmpMutableArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *tmpDictionary in inJSONArray)
    {
        [tmpMutableArray addObject:[DRBShot shotFromJSONDictionary:tmpDictionary]];
    }
    
    NSArray *tmpArray = [NSArray arrayWithArray:tmpMutableArray];
    [tmpMutableArray release];
    
    return tmpArray;
}

#pragma mark - Initialization

- (id)initWithJSONDictionary:(NSDictionary *)inJSONDictionary
{
    if (self = [super init])
	{
        NSString *tmpJsonKeyString = @"";

        tmpJsonKeyString = @"id";
        if ([inJSONDictionary objectForKey:tmpJsonKeyString] != [NSNull null])
            self.idString = [inJSONDictionary objectForKey:tmpJsonKeyString];
        
        tmpJsonKeyString = @"image_teaser_url";
        if ([inJSONDictionary objectForKey:tmpJsonKeyString] != [NSNull null])
            self.teaserImageUrlString = [inJSONDictionary objectForKey:tmpJsonKeyString];

        tmpJsonKeyString = @"image_url";
        if ([inJSONDictionary objectForKey:tmpJsonKeyString] != [NSNull null])
            self.imageUrlString = [inJSONDictionary objectForKey:tmpJsonKeyString];
        
        tmpJsonKeyString = @"player";
        if ([inJSONDictionary objectForKey:tmpJsonKeyString] != [NSNull null])
        {
            NSDictionary *tmpPlayerJSONDictionary = [inJSONDictionary objectForKey:tmpJsonKeyString];
            self.player = [[DRBPlayer alloc] initWithJSONDictionary:tmpPlayerJSONDictionary];
        }
        
        tmpJsonKeyString = @"views_count";
        if ([inJSONDictionary objectForKey:tmpJsonKeyString] != [NSNull null])
            self.viewsCountString = [[inJSONDictionary objectForKey:tmpJsonKeyString] stringValue];

        tmpJsonKeyString = @"likes_count";
        if ([inJSONDictionary objectForKey:tmpJsonKeyString] != [NSNull null])
            self.likesCountString = [[inJSONDictionary objectForKey:tmpJsonKeyString] stringValue];
        
        tmpJsonKeyString = @"comments_count";
        if ([inJSONDictionary objectForKey:tmpJsonKeyString] != [NSNull null])
            self.commentsCountString = [[inJSONDictionary objectForKey:tmpJsonKeyString] stringValue];
    }
    return self;
}

- (id)init
{
    if (self = [super init])
	{
        
    }
    return self;
}

#pragma mark - Memory

- (void)dealloc
{
    self.idString = nil;
    self.teaserImageUrlString = nil;
    self.imageUrlString = nil;
    self.player = nil;
    
    [super dealloc];
}

@end
