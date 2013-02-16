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
    [_shotFeedView release];
    
    [DRBAPIHandler getMainFeedwithSuccessBlock:^(NSArray *inResponseArray)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [inResponseArray retain];
            [_shotFeedView updateTableViewWithShotArray:inResponseArray];
            [inResponseArray release];
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
            [tmpAlertView release];
        });
    }];
}

#pragma mark - DRBShotFeedViewDelegate

- (void)shotFeedViewGotASelectionOfShot:(DRBShot *)inShot
{
    // Show the details for this shot
    DRBShotDetailViewController *tmpShotDetailViewController = [[DRBShotDetailViewController alloc] init];
    [self.navigationController pushViewController:tmpShotDetailViewController animated:YES];
    [tmpShotDetailViewController release];

}

#pragma mark - Memory

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{   
    [super dealloc];
}

@end
