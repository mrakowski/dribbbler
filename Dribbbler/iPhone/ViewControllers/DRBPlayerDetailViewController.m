//
//  DRBPlayerDetailViewController.m
//  Dribbbler
//
//  Created by Michael Rakowski on 2/17/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import "DRBPlayerDetailViewController.h"
#import "DRBShotDetailViewController.h"

#import "DRBAPIHandler.h"

@interface DRBPlayerDetailViewController ()
@end

@implementation DRBPlayerDetailViewController

#pragma mark - Initialization

- (id)initWithPlayer:(DRBPlayer *)inPlayer
{
    self = [super init];
    if (self)
    {
        [self setPlayer:inPlayer];
        
        [self setTitle:[inPlayer titleNameString]];
    }
    return self;
}

#pragma mark - View

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Shot feed view
    _shotFeedView = [[DRBShotFeedView alloc] initWithFrame:CGRectMake(0.0f,
                                                                      CGRectGetMaxY(_playerInfoView.frame),
                                                                      self.view.bounds.size.width,
                                                                      self.view.bounds.size.height - CGRectGetMaxY(_playerInfoView.frame))];
    [_shotFeedView setDelegate:self];
    [_shotFeedView setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin];
    [self.view addSubview:_shotFeedView];
    
    // Player info view
    _playerInfoView = [[DRBPlayerDetailView alloc] initWithFrame:CGRectMake(0.0f,
                                                                            0.0f,
                                                                            self.view.bounds.size.width,
                                                                            DRBPlayerInfoViewHeightFloat)
                                                          player:_player];
    [_shotFeedView.tableView setTableHeaderView:_playerInfoView];
    
    // Get shots data for player
    [DRBAPIHandler getShotsForPlayer:_player
                    withSuccessBlock:^(NSArray *inShotArray)
     {
         dispatch_async(dispatch_get_main_queue(), ^
         {    
             [_shotFeedView updateTableViewWithShotArray:inShotArray];
         });
     }
                     andFailureBlock:^(NSError *inError)
     {}];
}

#pragma mark - DRBShotFeedViewDelegate

- (void)shotFeedViewReceivedSelectionForShot:(DRBShot *)inShot
{
    // Push shot detail view controller onto the stack
    DRBShotDetailViewController *tmpShotDetailViewController = [[DRBShotDetailViewController alloc] initWithShot:inShot];
    [self.navigationController pushViewController:tmpShotDetailViewController animated:YES];
}

@end
