//
//  DRBPlayer.h
//  Dribbbler
//
//  Created by Michael Rakowski on 2/16/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DRBPlayer : NSObject

@property(nonatomic, strong) NSString *nameString;
@property(nonatomic, strong) NSString *userNameString;
@property(nonatomic, strong) NSString *avatarUrlString;
@property(nonatomic, strong) NSString *locationString;

- (id)initWithJSONDictionary:(NSDictionary *)inJSONDictionary;

- (NSString *)titleNameString;

@end
