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
#import <APAvatarImageView/APAvatarImageView.h>

@interface DRBPlayerDetailView()
{
	APAvatarImageView *_avatarImageView;
}

@property(nonatomic, strong) DRBPlayer *player;

@end

@implementation DRBPlayerDetailView

- (id)initWithFrame:(CGRect)frame player:(DRBPlayer *)inPlayer
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setPlayer:inPlayer];
        
        // Avatar image view
		_avatarImageView = [[APAvatarImageView alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 90.0f, 90.0f)
														borderColor:[UIColor blackColor]
														borderWidth:1.0f];
		[_avatarImageView setBorderWidth:2.0];
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
        
        // Player info label
        UILabel *tmpPlayerInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_avatarImageView.frame) + tmpHorizontalPadding,
																				_avatarImageView.frame.origin.y,
																				200,
																				_avatarImageView.bounds.size.height)];
		[tmpPlayerInfoLabel setNumberOfLines:0];
        [tmpPlayerInfoLabel setBackgroundColor:[UIColor clearColor]];
        [tmpPlayerInfoLabel setFont:[UIFont systemFontOfSize:16]];
		[tmpPlayerInfoLabel setText:[NSString stringWithFormat:@"%@\n%@", inPlayer.nameString, inPlayer.locationString]];
		[tmpPlayerInfoLabel setShadowColor:[UIColor whiteColor]];
        [tmpPlayerInfoLabel setShadowOffset:CGSizeMake(0,1)];
        [self addSubview:tmpPlayerInfoLabel];
    }
    return self;
}

@end
