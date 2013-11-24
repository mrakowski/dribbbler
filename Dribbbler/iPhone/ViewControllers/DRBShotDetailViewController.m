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
        [self setShot:inShot];
    }
    return self;
}

#pragma mark - View

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:_shot.titleString];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    // Shot detail view
    _shotDetailView = [[DRBShotDetailView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) shot:_shot];
    [_shotDetailView.playerButton addTarget:self action:@selector(tappedPlayerNameButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_shotDetailView];
}

#pragma mark - Control actions

- (void)tappedPlayerNameButton
{
    // Push player detail view controller onto the stack
    DRBPlayerDetailViewController *tmpPlayerDetailViewController = [[DRBPlayerDetailViewController alloc] initWithPlayer:_shot.player];
    [self.navigationController pushViewController:tmpPlayerDetailViewController animated:YES];
}

@end
