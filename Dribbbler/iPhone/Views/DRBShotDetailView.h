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

@property(nonatomic, strong) DRBShot *shot;
@property(nonatomic, strong) UIImageView *shotImageView;
@property(nonatomic, strong) UIButton *playerButton;

- (id)initWithFrame:(CGRect)frame shot:(DRBShot *)inShot;

@end
