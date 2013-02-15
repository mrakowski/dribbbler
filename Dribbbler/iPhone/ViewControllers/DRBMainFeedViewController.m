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
