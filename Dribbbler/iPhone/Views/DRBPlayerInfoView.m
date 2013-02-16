//
//  DRBPlayerInfoView.m
//  Dribbbler
//
//  Created by Michael Rakowski on 2/16/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import "DRBPlayerInfoView.h"

@implementation DRBPlayerInfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor magentaColor];
        
        UILabel *tmpLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 300, 40)];
        tmpLabel.text = @"";
        //[self addSubview:tmpLabel];
        [tmpLabel release];
    
    }
    return self;
}



@end
