//
//  DRBMainFeedViewController.m
//  Dribbbler
//
//  Created by Michael Rakowski on 2/14/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import "DRBMainFeedViewController.h"

#import "DRBAPIHandler.h"

@interface DRBMainFeedViewController ()
@end

@implementation DRBMainFeedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor yellowColor];
    
    [DRBAPIHandler getMainFeedwithSuccessBlock:^(NSArray *inResponseArray)
    {
        self.shotArray = inResponseArray;
        NSLog(@"_shotArray: %@", _shotArray);
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

#pragma mark - Memory

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    self.shotArray = nil;
    
    [super dealloc];
}

@end
