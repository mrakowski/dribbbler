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

#pragma mark -

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _playerInfoView = [[DRBPlayerInfoView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, DRBPlayerInfoViewHeightFloat)];
    [self.view addSubview:_playerInfoView];
    [_playerInfoView release];
	
}

#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
