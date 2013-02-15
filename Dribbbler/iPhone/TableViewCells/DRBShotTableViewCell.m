//
//  DRBShotTableViewCell.m
//  Dribbbler
//
//  Created by Michael Rakowski on 2/14/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import "DRBShotTableViewCell.h"

@implementation DRBShotTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        //self.contentView.backgroundColor = [UIColor magentaColor];
        
        UIImageView *tmpImageView = [[UIImageView alloc] init];
        tmpImageView.backgroundColor = [UIColor cyanColor];
        tmpImageView.frame = CGRectMake(0.0f, 0.0f, self.contentView.bounds.size.width, self.contentView.bounds.size.height);
        
        tmpImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
        
        [tmpImageView setContentMode: UIViewContentModeScaleAspectFit];
        tmpImageView.clipsToBounds = YES;
        tmpImageView.userInteractionEnabled = YES;
        [self.contentView addSubview:tmpImageView];
        [tmpImageView release];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateWithShot:(DRBShot *)inShot
{
    
    

}

@end
