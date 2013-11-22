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

@property(nonatomic, strong) NSString *idString;
@property(nonatomic, strong) NSString *titleString;
@property(nonatomic, strong) NSString *teaserImageUrlString;
@property(nonatomic, strong) NSString *imageUrlString;
@property(nonatomic, strong) DRBPlayer *player;
@property(nonatomic, strong) NSString *viewsCountString;
@property(nonatomic, strong) NSString *likesCountString;
@property(nonatomic, strong) NSString *commentsCountString;

+ (DRBShot *)shotFromJSONDictionary:(NSDictionary *)inJSONDictionary;
+ (NSArray *)shotArrayFromJSONArray:(NSArray *)inJSONArray;

@end
