//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Rahim Sonawalla on 4/20/14.
//  Copyright (c) 2014 Hi Rahim. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore ()

@property (nonatomic) NSMutableArray *privateItemsUnder50;
@property (nonatomic) NSMutableArray *privateItemsOver50;

@end

@implementation BNRItemStore

+ (instancetype)sharedStore
{
    static BNRItemStore *sharedStore = nil;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[BNRItemStore sharedStore]" userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        _privateItemsUnder50 = [[NSMutableArray alloc] init];
        _privateItemsOver50 = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSArray *)allItemsUnder50
{
    return self.privateItemsUnder50;
}

- (NSArray *)allItemsOver50
{
    return self.privateItemsOver50;
}

- (BNRItem *)createItem
{
    BNRItem *randomItem = [BNRItem randomItem];
    
    if (randomItem.valueInDollars >= 50)
    {
        [self.privateItemsOver50 addObject:randomItem];
    }
    else {
        [self.privateItemsUnder50 addObject:randomItem];
    }
    
    return randomItem;
}

@end
