//
//  DRBPlayerDetailViewController.m
//  Dribbbler
//
//  Created by Michael Rakowski on 2/17/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import "DRBPlayerDetailViewController.h"

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
    _shotFeedView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:_shotFeedView];
    [_shotFeedView release];
    
    // Player info view
    _playerInfoView = [[DRBPlayerInfoView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, DRBPlayerInfoViewHeightFloat)
                                                     andPlayer:_player];
    _shotFeedView.tableView.tableHeaderView = _playerInfoView;
    [_playerInfoView release];
    
    [DRBAPIHandler getShotsForPlayer:_player
                    withSuccessBlock:^(NSArray *inShotArray)
     {
         dispatch_async(dispatch_get_main_queue(), ^{
             
             [_shotFeedView updateTableViewWithShotArray:inShotArray];
         });
     }
                     andFailureBlock:^(NSError *inError)
     {
         
     }];
}

#pragma mark - Memory

- (void)dealloc
{
    self.player = nil;
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
