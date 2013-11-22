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
        self.player = inPlayer;
        
        self.title = [inPlayer titleNameString];
    }
    return self;
}

#pragma mark - View

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Shot feed view
    _shotFeedView = [[DRBShotFeedView alloc] initWithFrame:CGRectMake(0,
                                                                      CGRectGetMaxY(_playerInfoView.frame),
                                                                      self.view.bounds.size.width,
                                                                      self.view.bounds.size.height - self.navigationController.navigationBar.bounds.size.height - CGRectGetMaxY(_playerInfoView.frame))];
    _shotFeedView.delegate = self;
    _shotFeedView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:_shotFeedView];
    
    // Player info view
    _playerInfoView = [[DRBPlayerDetailView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, DRBPlayerInfoViewHeightFloat)
                                                          player:_player];
    _shotFeedView.tableView.tableHeaderView = _playerInfoView;
    
    [DRBAPIHandler getShotsForPlayer:_player
                    withSuccessBlock:^(NSArray *inShotArray)
     {
         dispatch_async(dispatch_get_main_queue(), ^
         {    
             [_shotFeedView updateTableViewWithShotArray:inShotArray];
         });
     }
                     andFailureBlock:^(NSError *inError)
     {   
     }];
}

#pragma mark - DRBShotFeedViewDelegate

- (void)shotFeedViewReceivedSelectionForShot:(DRBShot *)inShot
{
    DRBShotDetailViewController *tmpShotDetailViewController = [[DRBShotDetailViewController alloc] initWithShot:inShot];
    [self.navigationController pushViewController:tmpShotDetailViewController animated:YES];
}

#pragma mark - Memory


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
