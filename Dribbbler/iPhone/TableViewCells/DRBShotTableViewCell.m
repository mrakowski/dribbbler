//
//  DRBShotTableViewCell.m
//  Dribbbler
//
//  Created by Michael Rakowski on 2/14/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import "DRBShotTableViewCell.h"

#import "DRBAPIHandler.h"
#import "DRBCacheHandler.h"

#import "UIImageView+RemoteImage.h"

CGFloat const DRBShotTableViewCellBottomBorderHeight = 2.0f;

@implementation DRBShotTableViewCell

#pragma mark - Initialization

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _shotImageView = [[UIImageView alloc] init];
        _shotImageView.frame = CGRectMake(0.0f, 0.0f, self.contentView.bounds.size.width, self.contentView.bounds.size.height - DRBShotTableViewCellBottomBorderHeight);
        _shotImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        [_shotImageView setContentMode: UIViewContentModeScaleAspectFill];
        _shotImageView.clipsToBounds = YES;
        _shotImageView.userInteractionEnabled = YES;
        [self.contentView addSubview:_shotImageView];
        [_shotImageView release];
    }
    return self;
}

#pragma mark - Selection

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

#pragma mark - Public

- (void)updateWithShot:(DRBShot *)inShot
{
    _shotImageView.image = nil;
    
    [_shotImageView loadImageWithUrl:[NSURL URLWithString:inShot.imageUrlString]
                   andOperationQueue:[DRBAPIHandler sharedInstance].operationQueue
                         andUseCache:[DRBCacheHandler sharedCache]];
}

@end
