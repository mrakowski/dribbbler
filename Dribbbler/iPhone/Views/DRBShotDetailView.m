//
//  DRBShotDetailView.m
//  Dribbbler
//
//  Created by Michael Rakowski on 2/17/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import "DRBShotDetailView.h"

#import "DRBAPIHandler.h"
#import "DRBCacheHandler.h"

#import "UIColor+Dribbbler.h"
#import "UIImageView+RemoteImage.h"

@implementation DRBShotDetailView

- (id)initWithFrame:(CGRect)frame shot:(DRBShot *)inShot
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Shot image view
        _shotImageView = [[UIImageView alloc] init];
        [_shotImageView setFrame:CGRectMake(0.0f, 0.0f, self.bounds.size.width, 240.0f)];
        [_shotImageView setContentMode: UIViewContentModeScaleAspectFill];
        [_shotImageView setClipsToBounds:YES];
        [_shotImageView setUserInteractionEnabled:YES];
        [_shotImageView loadImageWithUrl:[NSURL URLWithString:inShot.imageUrlString] andOperationQueue:[DRBAPIHandler sharedInstance].operationQueue andUseCache:[DRBCacheHandler sharedCache]];
        [self addSubview:_shotImageView];
        
		// Margins
		CGFloat tmpHorizontalMarginFloat = 10.0f;
        CGFloat tmpVerticalMarginFloat = 10.0f;
        
        // Shot info label
        UILabel *tmpShotInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(tmpHorizontalMarginFloat,
																			  CGRectGetMaxY(_shotImageView.frame) + tmpVerticalMarginFloat,
																			  self.bounds.size.width - tmpHorizontalMarginFloat*2,
																			  20.0f)];
        [tmpShotInfoLabel setText:[NSString stringWithFormat:@"%@ %@, %@ %@, %@ %@",
								   inShot.viewsCountString, ([inShot.viewsCountString isEqualToString:@"1"] ? @"View" : @"Views"),
								   inShot.likesCountString, ([inShot.likesCountString isEqualToString:@"1"] ? @"Like" : @"Likes"),
								   inShot.commentsCountString, ([inShot.commentsCountString isEqualToString:@"1"] ? @"Comment" : @"Comments")]];
        [self addSubview:tmpShotInfoLabel];
        
        // Player label
        UILabel *tmpPlayerLabel = [[UILabel alloc] initWithFrame:CGRectMake(tmpShotInfoLabel.frame.origin.x,
																			CGRectGetMaxY(tmpShotInfoLabel.frame) + 4.0f,
																			57.0f,
																			tmpShotInfoLabel.frame.size.height)];
        [tmpPlayerLabel setText:@"Player:"];
        [self addSubview:tmpPlayerLabel];
        
        // Player button
        _playerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playerButton setFrame:CGRectMake(CGRectGetMaxX(tmpPlayerLabel.frame),
										   tmpPlayerLabel.frame.origin.y,
										   self.bounds.size.width - CGRectGetMaxX(tmpPlayerLabel.frame),
										   tmpPlayerLabel.frame.size.height + 2.0f)];
        [_playerButton setTitle:inShot.player.nameString forState:UIControlStateNormal];
        [_playerButton.titleLabel setFont:tmpPlayerLabel.font];
        [_playerButton setTitleColor:[UIColor playerButtonColor] forState:UIControlStateNormal];
        [_playerButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [self addSubview:_playerButton];
    }
    return self;
}

@end
