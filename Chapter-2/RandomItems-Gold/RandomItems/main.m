//
//  main.m
//  RandomItems
//
//  Created by Rahim Sonawalla on 3/20/14.
//  Copyright (c) 2014 Hi Rahim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // Create a mutable array object, store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 10; i++) {
            BNRItem *item = [BNRItem randomItem];
            [items addObject:item];
        }
        
        for (BNRItem *item in items) {
            NSLog(@"%@", item);
        }
        
        BNRContainer *container = [[BNRContainer alloc] init];
        [container setContainerName:@"Test container"];
        [container addItem:[BNRItem randomItem]];
        [container addItem:[BNRItem randomItem]];
        
        BNRContainer *superContainer = [[BNRContainer alloc] init];
        [superContainer setContainerName:@"Super Container"];
        [superContainer addItem:container];
        [superContainer addItem:[BNRItem randomItem]];
        
        BNRContainer *superSuperContainer = [[BNRContainer alloc] init];
        [superSuperContainer setContainerName:@"Super Super Container"];
        [superSuperContainer addItem:superContainer];
        
        NSLog(@"Container: %@", container);
        NSLog(@"Super Container: %@", superContainer);
        NSLog(@"Super Super Container: %@", superSuperContainer);
        
        items = nil;
    }
    
    return 0;
}

