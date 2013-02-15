//
//  DRBShot.h
//  Dribbbler
//
//  Created by Michael Rakowski on 2/14/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DRBShot : NSObject

@property(nonatomic, retain) NSString *teaserImageUrlString;
@property(nonatomic, retain) NSString *imageUrlString;

+ (DRBShot *)shotFromJSONDictionary:(NSDictionary *)inJSONDictionary;
+ (NSArray *)shotArrayFromJSONArray:(NSArray *)inJSONArray;

@end
