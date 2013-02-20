//
//  DRBShotDetailView.h
//  Dribbbler
//
//  Created by Michael Rakowski on 2/17/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DRBShot.h"

#import "RRRRemoteImageView.h"

@interface DRBShotDetailView : UIView

@property(nonatomic, retain) DRBShot *shot;
@property(nonatomic, retain) RRRRemoteImageView *shotImageView;
@property(nonatomic, retain) UIButton *playerButton;

- (id)initWithFrame:(CGRect)frame andShot:(DRBShot *)inShot;

@end
