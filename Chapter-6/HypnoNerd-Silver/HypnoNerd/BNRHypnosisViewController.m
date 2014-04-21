//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Rahim Sonawalla on 4/19/14.
//  Copyright (c) 2014 Hi Rahim. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.tabBarItem.title = @"Hypnotize";
        
        UIImage *i = [UIImage imageNamed:@"Hypno"];
        
        self.tabBarItem.image = i;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"BNRHypnosisViewController loaded its view.");
}

- (void)changeColor:(id)sender
{
    BNRHypnosisView *hypnosisView = (BNRHypnosisView *)self.view;
    UISegmentedControl *s = (UISegmentedControl *)sender;
    int index = [s selectedSegmentIndex];
    
    if (index == 0) {
        hypnosisView.circleColor = [UIColor redColor];
    }
    else if (index == 1) {
        hypnosisView.circleColor = [UIColor blueColor];
    }
    else if (index == 2) {
        hypnosisView.circleColor = [UIColor greenColor];
    }
}

@end
