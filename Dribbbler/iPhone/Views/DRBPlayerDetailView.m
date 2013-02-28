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

- (id)initWithFrame:(CGRect)frame andPlayer:(DRBPlayer *)inPlayer
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.player = inPlayer;
        
        _avatarImageView = [[UIImageView alloc] init];
        _avatarImageView.frame = CGRectMake(10.0f, 10.0f, 90.0f, 90.0f);
        [_avatarImageView setContentMode: UIViewContentModeScaleAspectFill];
        _avatarImageView.clipsToBounds = NO;
        _avatarImageView.userInteractionEnabled = YES;
        _avatarImageView.layer.shadowColor = [UIColor blackColor].CGColor;
        _avatarImageView.layer.shadowOffset = CGSizeMake(0, 1);
        _avatarImageView.layer.shadowOpacity = 0.7f;
        _avatarImageView.layer.shadowRadius = 1.0f;
        [self addSubview:_avatarImageView];
        [_avatarImageView release];
        
        [DRBAPIHandler loadImageWithUrlString:_player.avatarUrlString
                             withSuccessBlock:^(UIImage *inImage)
        {
            dispatch_async(dispatch_get_main_queue(), ^
            {    
                [_avatarImageView setImage:inImage];
            });
        }
                              andFailureBlock:^(NSArray *inResponseArray)
        {
        }];
        
        CGFloat tmpHorizontalPadding = 10.0f;
        
        UILabel *tmpPlayerNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_avatarImageView.frame) + tmpHorizontalPadding, _avatarImageView.frame.origin.y, 200, 22)];
        tmpPlayerNameLabel.backgroundColor = [UIColor clearColor];
        tmpPlayerNameLabel.font = [UIFont boldSystemFontOfSize:17];
        tmpPlayerNameLabel.text = inPlayer.nameString;
        tmpPlayerNameLabel.shadowColor = [UIColor whiteColor];
        tmpPlayerNameLabel.shadowOffset = CGSizeMake(0,1);
        [self addSubview:tmpPlayerNameLabel];
        [tmpPlayerNameLabel release];
        
        UILabel *tmpPlayerLocationLabel = [[UILabel alloc] initWithFrame:CGRectMake(tmpPlayerNameLabel.frame.origin.x, CGRectGetMaxY(tmpPlayerNameLabel.frame), tmpPlayerNameLabel.bounds.size.width, tmpPlayerNameLabel.bounds.size.height)];
        tmpPlayerLocationLabel.backgroundColor = [UIColor clearColor];
        tmpPlayerLocationLabel.font = tmpPlayerNameLabel.font;
        tmpPlayerLocationLabel.text = inPlayer.locationString;
        tmpPlayerLocationLabel.shadowColor = tmpPlayerNameLabel.shadowColor;
        tmpPlayerLocationLabel.shadowOffset = tmpPlayerNameLabel.shadowOffset;
        [self addSubview:tmpPlayerLocationLabel];
        [tmpPlayerLocationLabel release];
    }
    return self;
}

@end
