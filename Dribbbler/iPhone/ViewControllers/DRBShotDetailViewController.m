//
//  DRBShotDetailViewController.m
//  Dribbbler
//
//  Created by Michael Rakowski on 2/16/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import "DRBShotDetailViewController.h"

@interface DRBShotDetailViewController ()
@end

@implementation DRBShotDetailViewController

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
    
    _playerInfoView = [[DRBPlayerInfoView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, DRBPlayerInfoViewHeightFloat)
                                                     andPlayer:_player];
    [self.view addSubview:_playerInfoView];
    [_playerInfoView release];
	
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
