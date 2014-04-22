//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Rahim Sonawalla on 4/20/14.
//  Copyright (c) 2014 Hi Rahim. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItem.h"
#import "BNRItemStore.h"

@implementation BNRItemsViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"More than $50";
    }
    else {
        return @"Less than $50";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [[[BNRItemStore sharedStore] allItemsOver50] count];
    }
    else {
        return [[[BNRItemStore sharedStore] allItemsUnder50] count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld %ld", (long)indexPath.section, (long)indexPath.row);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSArray *items;
    BNRItem *item;
    
    if (indexPath.section == 0) {
        items = [[BNRItemStore sharedStore] allItemsOver50];
    }
    else {
        items = [[BNRItemStore sharedStore] allItemsUnder50];
    }
    
    item = items[indexPath.row];
    cell.textLabel.text = [item description];
    return cell;
}

@end
