//
//  DRBShotTableViewCell.h
//  Dribbbler
//
//  Created by Michael Rakowski on 2/14/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DRBShot.h"

@interface DRBShotTableViewCell : UITableViewCell

@property(nonatomic, strong) UIImageView *shotImageView;
@property(nonatomic, strong) UILabel *titleLabel;

- (void)updateWithShot:(DRBShot *)inShot;

@end
