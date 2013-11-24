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

@property(nonatomic, strong) UIImageView *shotImageView;
@property(nonatomic, strong) UIButton *playerButton;

/**
 *  Initialize with frame
 *  @param frame  The frame used for initialization
 *  @param inShot An object of type DRBShot used to initialize the view
 *  @return A DRBShotDetailView object
 */
- (id)initWithFrame:(CGRect)frame shot:(DRBShot *)inShot;

@end
