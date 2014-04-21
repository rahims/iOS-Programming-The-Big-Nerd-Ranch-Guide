//
//  BNRContainer.h
//  RandomItems
//
//  Created by Rahim Sonawalla on 4/15/14.
//  Copyright (c) 2014 Hi Rahim. All rights reserved.
//

#import "BNRItem.h"

@interface BNRContainer : BNRItem
{
    NSMutableArray *_subitems;
    NSString *_containerName;
}

- (void)setContainerName:(NSString *)str;
- (NSString *)containerName;

- (NSArray *)items;

- (void)addItem:(BNRItem *)item;
- (BNRItem *)itemAtIndex:(int)index;

- (int)valueInDollars;

@end
