//
//  DRBShotTableViewCell.m
//  Dribbbler
//
//  Created by Michael Rakowski on 2/14/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import "DRBShotTableViewCell.h"

#import "DRBAPIHandler.h"

CGFloat const DRBShotTableViewCellBottomBorderHeight = 2.0f;

@implementation DRBShotTableViewCell

#pragma mark - Initialization

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
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

#pragma mark - 

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

#pragma mark - Public

- (void)updateWithShot:(DRBShot *)inShot
{
    // MIKE TODO: store downloaded images in an NSCache
    
    self.shotImageView.image = nil;
    
    [DRBAPIHandler loadImageWithUrlString:inShot.imageUrlString withSuccessBlock:^(UIImage *inImage)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
     
            [self.shotImageView setImage:inImage];
            [self layoutSubviews];
        });
    }
                          andFailureBlock:^(NSArray *inResponseArray)
    {
        
    }];
}

@end
