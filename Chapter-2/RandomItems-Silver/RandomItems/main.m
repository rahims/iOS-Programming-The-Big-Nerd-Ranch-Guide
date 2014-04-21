//
//  main.m
//  RandomItems
//
//  Created by Rahim Sonawalla on 3/20/14.
//  Copyright (c) 2014 Hi Rahim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // Create a mutable array object, store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 10; i++) {
            BNRItem *item = [BNRItem randomItem];
            [items addObject:item];
        }
        
        // Test new initializer
        BNRItem *itemWithNameAndSerial = [[BNRItem alloc] initWithName:@"Green Sofa" serialNumber:@"123"];
        [items addObject:itemWithNameAndSerial];
        
        for (BNRItem *item in items) {
            NSLog(@"%@", item);
        }
        
        items = nil;
    }
    
    return 0;
}

