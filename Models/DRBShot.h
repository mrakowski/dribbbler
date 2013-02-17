//
//  DRBShot.h
//  Dribbbler
//
//  Created by Michael Rakowski on 2/14/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DRBPlayer.h"

@interface DRBShot : NSObject

@property(nonatomic, retain) NSString *idString;
@property(nonatomic, retain) NSString *teaserImageUrlString;
@property(nonatomic, retain) NSString *imageUrlString;
@property(nonatomic, retain) DRBPlayer *player;
@property(nonatomic, retain) NSString *viewsCountString;
@property(nonatomic, retain) NSString *likesCountString;
@property(nonatomic, retain) NSString *commentsCountString;

+ (DRBShot *)shotFromJSONDictionary:(NSDictionary *)inJSONDictionary;
+ (NSArray *)shotArrayFromJSONArray:(NSArray *)inJSONArray;

@end
