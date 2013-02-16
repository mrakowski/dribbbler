//
//  DRBPlayerInfoView.m
//  Dribbbler
//
//  Created by Michael Rakowski on 2/16/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import "DRBPlayerInfoView.h"

#import "DRBAPIHandler.h"

@implementation DRBPlayerInfoView

- (id)initWithFrame:(CGRect)frame andPlayer:(DRBPlayer *)inPlayer
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.player = inPlayer;
        
        _avatarImageView = [[UIImageView alloc] init];
        _avatarImageView.frame = CGRectMake(10.0f, 10.0f, 90.0f, 90.0f);
        [_avatarImageView setContentMode: UIViewContentModeScaleAspectFill];
        _avatarImageView.clipsToBounds = YES;
        _avatarImageView.userInteractionEnabled = YES;
        [self addSubview:_avatarImageView];
        [_avatarImageView release];
        
        [DRBAPIHandler loadImageWithUrlString:_player.avatarUrlString
                             withSuccessBlock:^(UIImage *inImage)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [_avatarImageView setImage:inImage];
            });
            
        }
                              andFailureBlock:^(NSArray *inResponseArray)
        {
        }];
        
        CGFloat tmpHorizontalPadding = 10.0f;
        
        UILabel *tmpLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_avatarImageView.frame) + tmpHorizontalPadding, _avatarImageView.frame.origin.y, 220, 40)];
        tmpLabel.text = inPlayer.nameString;
        [self addSubview:tmpLabel];
        [tmpLabel release];
    
    }
    return self;
}



@end
