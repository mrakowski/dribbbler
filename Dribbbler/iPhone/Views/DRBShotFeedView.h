//
//  DRBFeedView.h
//  Dribbbler
//
//  Created by Michael Rakowski on 2/14/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DRBShotFeedView : UIView <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, retain) UITableView *tableView;

@end
