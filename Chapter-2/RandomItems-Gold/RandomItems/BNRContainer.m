//
//  BNRContainer.m
//  RandomItems
//
//  Created by Rahim Sonawalla on 4/15/14.
//  Copyright (c) 2014 Hi Rahim. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _containerName = @"";
        _subitems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)setContainerName:(NSString *)str
{
    _containerName = str;
}

- (NSString *)containerName
{
    return _containerName;
}

- (NSArray *)items
{
    return [[NSArray alloc] initWithArray:_subitems];
}

- (void)addItem:(BNRItem *)item
{
    [_subitems addObject:item];
}

- (BNRItem *)itemAtIndex:(int)index
{
    return _subitems[index];
}

- (int)valueInDollars
{
    int total = 0;
    
    for (BNRItem *item in self.items) {
        total += item.valueInDollars;
    }
    
    return total;
}

- (NSString *)description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ Total value: %d, items: %@",
                                   self.containerName, self.valueInDollars, self.items];
    
    return descriptionString;
}
@end
