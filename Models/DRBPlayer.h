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

- (id)initWithJSONDictionary:(NSDictionary *)inJSONDictionary;

@end
