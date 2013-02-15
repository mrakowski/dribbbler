//
//  DRBDRBAPIHandler.m
//  Dribbbler
//
//  Created by Michael Rakowski on 2/14/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import "DRBAPIHandler.h"

static DRBAPIHandler *instance;

static NSString *const DRBAPIHandlerMainFeedUrlString = @"http://api.dribbble.com/shots/everyone";

@implementation DRBAPIHandler

#pragma mark -

+ (DRBAPIHandler *)sharedInstance
{
	if (!instance)
    {
		instance = [[DRBAPIHandler alloc] init];
        instance.operationQueue = [[NSOperationQueue alloc] init];
    }
    
	return instance;
}

+ (void)destroyInstance
{
	if (instance)
	{
        instance.operationQueue = nil;
		[instance release];
		instance = nil;
	}
}

#pragma mark -

+ (void)getMainFeedwithSuccessBlock:(void (^)(NSArray *inResponseArray))inSuccessBlock andFailureBlock:(void (^)(NSError *inError))inFailureBlock
{
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:DRBAPIHandlerMainFeedUrlString] ]
                                       queue:[DRBAPIHandler sharedInstance].operationQueue
                           completionHandler:^(NSURLResponse *inResponse, NSData *inData, NSError *inError)
     {
         NSDictionary *tmpJsonDictionary = [NSJSONSerialization JSONObjectWithData:inData options:NSJSONReadingAllowFragments error:nil];
         //NSLog(@"tmpJsonDictionary: %@", tmpJsonDictionary);
         
         NSArray *tmpShotsJsonArray = [tmpJsonDictionary objectForKey:@"shots"];
         NSLog(@"tmpShotsJsonArray: %@", tmpShotsJsonArray);
     }];
}

+ (void)loadImageWithUrlString:(NSString *)inUrlString withSuccessBlock:(void (^)(UIImage *inImage))inSuccessBlock andFailureBlock:(void (^)(NSArray *inResponseArray))inFailureBlock
{
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:inUrlString] ]
                                       queue:[DRBAPIHandler sharedInstance].operationQueue
                           completionHandler:^(NSURLResponse *inResponse, NSData *inData, NSError *inError)
     {
         inSuccessBlock([UIImage imageWithData:inData]);
     }];
}

#pragma mark - Memory

- (void)dealloc
{
	[super dealloc];
}

@end
