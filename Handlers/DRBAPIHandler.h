//
//  DRBDRBAPIHandler.h
//  Dribbbler
//
//  Created by Michael Rakowski on 2/14/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DRBAPIHandler : NSObject

@property(nonatomic, retain) NSOperationQueue *operationQueue;

+ (DRBAPIHandler *)sharedInstance;
+ (void)destroyInstance;

+ (void)getMainFeedwithSuccessBlock:(void (^)(NSArray *inResponseArray))inSuccessBlock andFailureBlock:(void (^)(NSArray *inResponseArray))inFailureBlock;
+ (void)loadImageWithUrlString:(NSString *)inUrlString withSuccessBlock:(void (^)(UIImage *inImage))inSuccessBlock andFailureBlock:(void (^)(NSArray *inResponseArray))inFailureBlock;

@end