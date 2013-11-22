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
        
        tmpJsonKeyString = @"location";
        if ([inJSONDictionary objectForKey:tmpJsonKeyString] != [NSNull null])
            self.locationString = [inJSONDictionary objectForKey:tmpJsonKeyString];
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

#pragma mark - Public helper methods

- (NSString *)titleNameString
{
    // Return the string to use in the title bar. Use the first name if possible.
    
    NSString *tmpTitleString = @"";
    
    if (_nameString != nil)
    {
        NSArray *tmpStringComponentsArray = [_nameString componentsSeparatedByString:@" "];
        if ([tmpStringComponentsArray count] > 1)
            tmpTitleString = [tmpStringComponentsArray objectAtIndex:0];
    }
    
    return tmpTitleString;
}

#pragma mark - Memory


@end
