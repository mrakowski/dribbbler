//
//  DRBFeedView.h
//  Dribbbler
//
//  Created by Michael Rakowski on 2/14/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DRBShot.h"

@protocol DRBShotFeedViewDelegate;

@interface DRBShotFeedView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (weak) id<DRBShotFeedViewDelegate> delegate;
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *shotArray;

- (void)updateTableViewWithShotArray:(NSArray *)inShotArray;

@end

@protocol DRBShotFeedViewDelegate <NSObject>
@optional
- (void)shotFeedViewReceivedSelectionForShot:(DRBShot *)inShot;
@end