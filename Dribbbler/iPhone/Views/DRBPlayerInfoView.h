//
//  DRBPlayerInfoView.h
//  Dribbbler
//
//  Created by Michael Rakowski on 2/16/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DRBPlayer.h"

static CGFloat const DRBPlayerInfoViewHeightFloat = 164.0f;

@interface DRBPlayerInfoView : UIView

@property(nonatomic, retain) DRBPlayer *player;
@property(nonatomic, retain) UIImageView *avatarImageView;

- (id)initWithFrame:(CGRect)frame andPlayer:(DRBPlayer *)inPlayer;

@end
