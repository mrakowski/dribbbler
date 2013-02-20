//
//  DRBPlayer.h
//  Dribbbler
//
//  Created by Michael Rakowski on 2/16/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DRBPlayer : NSObject

@property(nonatomic, retain) NSString *nameString;
@property(nonatomic, retain) NSString *userNameString;
@property(nonatomic, retain) NSString *avatarUrlString;
@property(nonatomic, retain) NSString *locationString;

- (id)initWithJSONDictionary:(NSDictionary *)inJSONDictionary;

- (NSString *)titleNameString;

@end
