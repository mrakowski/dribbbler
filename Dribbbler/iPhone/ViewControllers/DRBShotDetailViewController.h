//
//  DRBShotDetailViewController.h
//  Dribbbler
//
//  Created by Michael Rakowski on 2/16/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DRBPlayerInfoView.h"

@interface DRBShotDetailViewController : UIViewController
{
    DRBPlayerInfoView *_playerInfoView;
}

@property(nonatomic, retain) DRBPlayer *player;

- (id)initWithPlayer:(DRBPlayer *)inPlayer;

@end
