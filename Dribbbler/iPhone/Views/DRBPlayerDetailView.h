//
//  DRBPlayerInfoView.h
//  Dribbbler
//
//  Created by Michael Rakowski on 2/16/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DRBPlayer.h"

static CGFloat const DRBPlayerInfoViewHeightFloat = 104.0f;

@interface DRBPlayerDetailView : UIView

@property(nonatomic, retain) DRBPlayer *player;
@property(nonatomic, retain) UIImageView *avatarImageView;

- (id)initWithFrame:(CGRect)frame player:(DRBPlayer *)inPlayer;

@end
