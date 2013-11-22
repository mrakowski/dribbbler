//
//  DRBFeedView.m
//  Dribbbler
//
//  Created by Michael Rakowski on 2/14/13.
//  Copyright (c) 2013 Michael Rakowski. All rights reserved.
//

#import "DRBShotFeedView.h"

#import "DRBShotTableViewCell.h"

#import "UIColor+Dribbbler.h"

static CGFloat const DRBShotFeedViewTableRowHeightFloat = 140.0f;

@implementation DRBShotFeedView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Set the initial shot array to an empty array
        [self setShotArray:@[]];
        
        // Table view
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) style:UITableViewStylePlain];
        [_tableView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin];
        [_tableView setRowHeight:DRBShotFeedViewTableRowHeightFloat];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_tableView setDataSource:self];
        [_tableView setDelegate:self];
        [_tableView setSeparatorColor:[UIColor clearColor]];
        [_tableView setBackgroundColor:[UIColor feedTableViewBackgroundColor]];
        [self addSubview:_tableView];
    }
    return self;
}

#pragma mark - Public methods

- (void)updateTableViewWithShotArray:(NSArray *)inShotArray
{
    [self setShotArray:inShotArray];
    
    [_tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [_shotArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  	static NSString *CellIdentifier = @"CellIdentifier";
    
	DRBShotTableViewCell *tmpShotTableViewCell = (DRBShotTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if (tmpShotTableViewCell == nil)
        tmpShotTableViewCell = [[DRBShotTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    DRBShot *tmpShot = [_shotArray objectAtIndex:indexPath.row];
    
    [tmpShotTableViewCell updateWithShot:tmpShot];
    
    return tmpShotTableViewCell;
}

#pragma mark - UITableViewDelegate

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	return [[UIView alloc] initWithFrame:CGRectZero];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 3.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
    DRBShot *tmpShot = [_shotArray objectAtIndex:indexPath.row];
    
    // Tell the delegate that a shot was selected
    if ([self.delegate respondsToSelector:@selector(shotFeedViewReceivedSelectionForShot:)])
        [self.delegate shotFeedViewReceivedSelectionForShot:tmpShot];
}

@end
