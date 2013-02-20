//
//  UIImageView+RemoteImageWithCaching.m
//  Dribbbler
//
//  Created by Michael Rakowski on 2/19/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import "UIImageView+RemoteImageWithCaching.h"

@implementation UIImageView (RemoteImageWithCaching)

- (void)loadImageWithUrl:(NSURL *)inUrl andOperationQueue:(NSOperationQueue *)inOperationQueue
{
    // MIKE TODO: add an image cache
    
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:inUrl]
                                       queue:inOperationQueue
                           completionHandler:^(NSURLResponse *inResponse, NSData *inData, NSError *inError)
     {
         dispatch_async(dispatch_get_main_queue(), ^
        {
            self.image = [UIImage imageWithData:inData];
        });
     }];
}

@end
