//
//  DRBPlayerInfoView.m
//  Dribbbler
//
//  Created by Michael Rakowski on 2/16/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import "DRBPlayerDetailView.h"

#import "DRBAPIHandler.h"

#import <QuartzCore/QuartzCore.h>

@implementation DRBPlayerDetailView

- (id)initWithFrame:(CGRect)frame player:(DRBPlayer *)inPlayer
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setPlayer:inPlayer];
        
        // Avatar image view
        _avatarImageView = [[UIImageView alloc] init];
        [_avatarImageView setFrame:CGRectMake(10.0f, 10.0f, 90.0f, 90.0f)];
        [_avatarImageView setContentMode: UIViewContentModeScaleAspectFill];
        [_avatarImageView setClipsToBounds:NO];
        [_avatarImageView setUserInteractionEnabled:YES];
        [_avatarImageView.layer setShadowColor:[UIColor blackColor].CGColor];
        [_avatarImageView.layer setShadowOffset:CGSizeMake(0, 1)];
        [_avatarImageView.layer setShadowOpacity:0.7f];
        [_avatarImageView.layer setShadowRadius:1.0f];
        [self addSubview:_avatarImageView];
        
        // Load avatar image
        [DRBAPIHandler loadImageWithUrlString:_player.avatarUrlString
                             withSuccessBlock:^(UIImage *inImage)
        {
            dispatch_async(dispatch_get_main_queue(), ^
            {    
                [_avatarImageView setImage:inImage];
            });
        }
                              andFailureBlock:^(NSArray *inResponseArray)
        {}];
        
        CGFloat tmpHorizontalPadding = 10.0f;
        
        // Player name label
        UILabel *tmpPlayerNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_avatarImageView.frame) + tmpHorizontalPadding, _avatarImageView.frame.origin.y, 200, 22)];
        [tmpPlayerNameLabel setBackgroundColor:[UIColor clearColor]];
        [tmpPlayerNameLabel setFont:[UIFont boldSystemFontOfSize:17]];
        [tmpPlayerNameLabel setText:inPlayer.nameString];
        [tmpPlayerNameLabel setShadowColor:[UIColor whiteColor]];
        [tmpPlayerNameLabel setShadowOffset:CGSizeMake(0,1)];
        [self addSubview:tmpPlayerNameLabel];
        
        // Player location label
        UILabel *tmpPlayerLocationLabel = [[UILabel alloc] initWithFrame:CGRectMake(tmpPlayerNameLabel.frame.origin.x, CGRectGetMaxY(tmpPlayerNameLabel.frame), tmpPlayerNameLabel.bounds.size.width, tmpPlayerNameLabel.bounds.size.height)];
        [tmpPlayerLocationLabel setBackgroundColor:[UIColor clearColor]];
        [tmpPlayerLocationLabel setFont:tmpPlayerNameLabel.font];
        [tmpPlayerLocationLabel setText:inPlayer.locationString];
        [tmpPlayerLocationLabel setShadowColor:tmpPlayerNameLabel.shadowColor];
        [tmpPlayerLocationLabel setShadowOffset:tmpPlayerNameLabel.shadowOffset];
        [self addSubview:tmpPlayerLocationLabel];
    }
    return self;
}

@end
