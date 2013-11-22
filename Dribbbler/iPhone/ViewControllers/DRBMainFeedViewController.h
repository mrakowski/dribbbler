//
//  DRBMainFeedViewController.h
//  Dribbbler
//
//  Created by Michael Rakowski on 2/14/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DRBShotFeedView.h"

@interface DRBMainFeedViewController : UIViewController <DRBShotFeedViewDelegate>

@property(nonatomic, strong) DRBShotFeedView *shotFeedView;

@end
