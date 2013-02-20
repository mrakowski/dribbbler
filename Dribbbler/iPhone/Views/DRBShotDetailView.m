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

- (id)initWithFrame:(CGRect)frame andShot:(DRBShot *)inShot
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.shot = inShot;
        
        _shotImageView = [[UIImageView alloc] init];
        _shotImageView.frame = CGRectMake(0.0f, 0.0f, self.bounds.size.width, 240.0f);
        [_shotImageView setContentMode: UIViewContentModeScaleAspectFill];
        _shotImageView.clipsToBounds = YES;
        _shotImageView.userInteractionEnabled = YES;
        [_shotImageView loadImageWithUrl:[NSURL URLWithString:_shot.imageUrlString] andOperationQueue:[DRBAPIHandler sharedInstance].operationQueue andUseCache:[DRBCacheHandler sharedCache]];
        [self addSubview:_shotImageView];
        [_shotImageView release];
        
        // MIKE TODO: check if this image is already in the cache
        
        /*
        [DRBAPIHandler loadImageWithUrlString:_shot.imageUrlString withSuccessBlock:^(UIImage *inImage)
         {
             dispatch_async(dispatch_get_main_queue(), ^
             {
                 [self.shotImageView setImage:inImage];
             });
         }
                              andFailureBlock:^(NSArray *inResponseArray)
         {
         }];
         
        */
        
        CGFloat tmpVerticalMarginFloat = 10.0f;
        
        // View count label
        UILabel *tmpViewsLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_shotImageView.frame) + tmpVerticalMarginFloat, 200, 20)] autorelease];
        tmpViewsLabel.text = [NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"DRBLocalizableStringsViews", @"DRBLocalizableStringsViews"), _shot.viewsCountString];
        [self addSubview:tmpViewsLabel];
        
        // Likes count label
        UILabel *tmpLikesLabel = [[[UILabel alloc] initWithFrame:CGRectMake(tmpViewsLabel.frame.origin.x, CGRectGetMaxY(tmpViewsLabel.frame), 300, tmpViewsLabel.frame.size.height)] autorelease];
        tmpLikesLabel.text = [NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"DRBLocalizableStringsLikes", @"DRBLocalizableStringsLikes"), _shot.likesCountString];
        [self addSubview:tmpLikesLabel];

        // Comments count label
        UILabel *tmpCommentsLabel = [[[UILabel alloc] initWithFrame:CGRectMake(tmpViewsLabel.frame.origin.x, CGRectGetMaxY(tmpLikesLabel.frame), 300, tmpViewsLabel.frame.size.height)] autorelease];
        tmpCommentsLabel.text = [NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"DRBLocalizableStringsComments", @"DRBLocalizableStringsComments"), _shot.commentsCountString];
        [self addSubview:tmpCommentsLabel];
        
        UILabel *tmpArtistLabel = [[[UILabel alloc] initWithFrame:CGRectMake(tmpViewsLabel.frame.origin.x, CGRectGetMaxY(tmpCommentsLabel.frame), 60, tmpViewsLabel.frame.size.height)] autorelease];
        tmpArtistLabel.text = @"Player:";
        [self addSubview:tmpArtistLabel];
        
        _playerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playerButton setFrame:CGRectMake(CGRectGetMaxX(tmpArtistLabel.frame), tmpArtistLabel.frame.origin.y, self.bounds.size.width - CGRectGetMaxX(tmpArtistLabel.frame), tmpArtistLabel.frame.size.height)];
        [_playerButton setTitle:_shot.player.nameString forState:UIControlStateNormal];
        _playerButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [_playerButton setTitleColor:[UIColor playerButtonColor] forState:UIControlStateNormal];
        [_playerButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [self addSubview:_playerButton];
    }
    return self;
}

@end
