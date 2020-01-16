//
//  ViewController.m
//  SST Open House
//
//  Created by Rayner Tan Xue Wen on 4/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize googleform;



- (void)viewDidLoad
{
    [super viewDidLoad];
    [googleform loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://docs.google.com/spreadsheet/embeddedform?formkey=dG1fZldPR0x1YlU0eGxSY2VyUXBlaVE6MQ"]]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
