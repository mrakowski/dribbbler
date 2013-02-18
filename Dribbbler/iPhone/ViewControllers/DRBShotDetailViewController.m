//
//  DRBShotDetailViewController.m
//  Dribbbler
//
//  Created by Michael Rakowski on 2/16/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import "DRBShotDetailViewController.h"
#import "DRBPlayerDetailViewController.h"

@interface DRBShotDetailViewController ()
@end

@implementation DRBShotDetailViewController

#pragma mark - Initialization

- (id)initWithShot:(DRBShot *)inShot
{
    self = [super init];
    if (self)
    {
        self.shot = inShot;
    }
    return self;
}

#pragma mark - View

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = _shot.titleString;
    
    _shotDetailView = [[DRBShotDetailView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) andShot:_shot];
    [_shotDetailView.playerButton addTarget:self action:@selector(tappedPlayerNameButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_shotDetailView];
    [_shotDetailView release];
}

#pragma mark - Control actions

- (void)tappedPlayerNameButton
{
    DRBPlayerDetailViewController *tmpPlayerDetailViewController = [[DRBPlayerDetailViewController alloc] initWithPlayer:_shot.player];
    [self.navigationController pushViewController:tmpPlayerDetailViewController animated:YES];
    [tmpPlayerDetailViewController release];
}

#pragma mark - Memory

- (void)dealloc
{
    self.shot = nil;
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
