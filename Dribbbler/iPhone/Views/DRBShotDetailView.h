//
//  DRBShotDetailView.h
//  Dribbbler
//
//  Created by Michael Rakowski on 2/17/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DRBShot.h"

@interface DRBShotDetailView : UIView

@property(nonatomic, retain) DRBShot *shot;
@property(nonatomic, retain) UIImageView *shotImageView;

- (id)initWithFrame:(CGRect)frame andShot:(DRBShot *)inShot;

@end
