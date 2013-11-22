//
//  DRBMainFeedViewController.m
//  Dribbbler
//
//  Created by Michael Rakowski on 2/14/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import "DRBMainFeedViewController.h"
#import "DRBShotDetailViewController.h"

#import "DRBAPIHandler.h"

@interface DRBMainFeedViewController ()
@end

@implementation DRBMainFeedViewController

#pragma mark - View

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"DRBLocalizableStringsEveryone", @"DRBLocalizableStringsEveryone");
	
    _shotFeedView = [[DRBShotFeedView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - self.navigationController.navigationBar.bounds.size.height)];
    _shotFeedView.delegate = self;
    [self.view addSubview:_shotFeedView];
    
    [DRBAPIHandler getMainFeedwithSuccessBlock:^(NSArray *inResponseArray)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [_shotFeedView updateTableViewWithShotArray:inResponseArray];
        });
    }
                               andFailureBlock:^(NSError *inError)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
           
            UIAlertView *tmpAlertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"DRBLocalizableStringsAlertTitle", @"DRBLocalizableStringsAlertTitle")
                                                                   message:NSLocalizedString(@"DRBLocalizableStringsProblemGettingMainFeed", @"DRBLocalizableStringsProblemGettingMainFeed")
                                                                  delegate:nil
                                                         cancelButtonTitle:NSLocalizedString(@"DRBLocalizableStringsClose", @"DRBLocalizableStringsClose")
                                                         otherButtonTitles:nil];
            [tmpAlertView show];
        });
    }];
}

#pragma mark - DRBShotFeedViewDelegate

- (void)shotFeedViewReceivedSelectionForShot:(DRBShot *)inShot
{
    // Show the details for this shot
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
