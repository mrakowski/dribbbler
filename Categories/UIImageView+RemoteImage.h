//
//  UIImageView+RemoteImageWithCaching.h
//  Dribbbler
//
//  Created by Michael Rakowski on 2/19/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (RemoteImage)

- (void)loadImageWithUrl:(NSURL *)inUrl andOperationQueue:(NSOperationQueue *)inOperationQueue andUseCache:(NSCache *)inCache;

@end
