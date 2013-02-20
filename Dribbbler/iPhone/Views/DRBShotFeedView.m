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
        self.shotArray = @[];
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) style:UITableViewStylePlain];
        [_tableView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin];
        [_tableView setRowHeight:DRBShotFeedViewTableRowHeightFloat];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView setDataSource:self];
        [_tableView setDelegate:self];
        _tableView.separatorColor = [UIColor clearColor];
        _tableView.backgroundColor = [UIColor feedTableViewBackgroundColor];
        [self addSubview:_tableView];
        [_tableView release];
    }
    return self;
}

#pragma mark - Public methods

- (void)updateTableViewWithShotArray:(NSArray *)inShotArray
{
    self.shotArray = inShotArray;
    
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
        tmpShotTableViewCell = [[[DRBShotTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    
    DRBShot *tmpShot = [_shotArray objectAtIndex:indexPath.row];
    
    [tmpShotTableViewCell updateWithShot:tmpShot];
    
    return tmpShotTableViewCell;
}

#pragma mark - UITableViewDelegate

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	return [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 3.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
    DRBShot *tmpShot = [_shotArray objectAtIndex:indexPath.row];
    
    if ([self.delegate respondsToSelector:@selector(shotFeedViewGotASelectionOfShot:)])
        [self.delegate shotFeedViewGotASelectionOfShot:tmpShot];
}

#pragma mark - Memory

- (void)dealloc
{
    self.shotArray = nil;
    
    [super dealloc];
}

@end
