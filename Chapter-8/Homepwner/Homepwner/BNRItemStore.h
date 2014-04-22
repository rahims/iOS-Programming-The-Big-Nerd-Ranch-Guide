//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Rahim Sonawalla on 4/20/14.
//  Copyright (c) 2014 Hi Rahim. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

+ (instancetype)sharedStore;
- (BNRItem *)createItem;

@end
