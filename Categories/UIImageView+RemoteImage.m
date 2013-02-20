//
//  UIImageView+RemoteImageWithCaching.m
//  Dribbbler
//
//  Created by Michael Rakowski on 2/19/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import "UIImageView+RemoteImage.h"

@implementation UIImageView (RemoteImage)

- (void)loadImageWithUrl:(NSURL *)inUrl andOperationQueue:(NSOperationQueue *)inOperationQueue andUseCache:(NSCache *)inCache
{
    UIImage *tmpImage = [inCache objectForKey:[inUrl absoluteString]];
    if (tmpImage == nil)
    {
        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:inUrl]
                                           queue:inOperationQueue
                               completionHandler:^(NSURLResponse *inResponse, NSData *inData, NSError *inError)
         {
             UIImage *tmpImage = [UIImage imageWithData:inData];
             [inCache setObject:tmpImage forKey:[inUrl absoluteString]];
             
             dispatch_async(dispatch_get_main_queue(), ^
            {
                self.image = tmpImage;
            });
         }];
    }
    else
    {
        self.image = tmpImage;
    }
}

@end
