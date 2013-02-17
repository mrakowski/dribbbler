//
//  DRBShotDetailViewController.h
//  Dribbbler
//
//  Created by Michael Rakowski on 2/16/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DRBShot.h"

@interface DRBShotDetailViewController : UIViewController
{

}

@property(nonatomic, retain) DRBShot *shot;

- (id)initWithShot:(DRBShot *)inShot;

@end
