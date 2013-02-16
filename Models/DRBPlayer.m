//
//  DRBPlayer.m
//  Dribbbler
//
//  Created by Michael Rakowski on 2/16/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import "DRBPlayer.h"

@implementation DRBPlayer

#pragma mark - Initialization

- (id)initWithJSONDictionary:(NSDictionary *)inJSONDictionary
{
    if (self = [super init])
	{
        NSString *tmpJsonKeyString = @"";
        
        tmpJsonKeyString = @"name";
        if ([inJSONDictionary objectForKey:tmpJsonKeyString] != [NSNull null])
            self.nameString = [inJSONDictionary objectForKey:tmpJsonKeyString];
        
        tmpJsonKeyString = @"username";
        if ([inJSONDictionary objectForKey:tmpJsonKeyString] != [NSNull null])
            self.userNameString = [inJSONDictionary objectForKey:tmpJsonKeyString];
        
        tmpJsonKeyString = @"avatar_url";
        if ([inJSONDictionary objectForKey:tmpJsonKeyString] != [NSNull null])
            self.avatarUrlString = [inJSONDictionary objectForKey:tmpJsonKeyString];
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
    self.nameString = nil;
    self.userNameString = nil;
    
    [super dealloc];
}

@end
