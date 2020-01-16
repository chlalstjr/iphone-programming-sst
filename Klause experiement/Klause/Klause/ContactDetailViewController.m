//
//  ContactDetailViewController.m
//  Klause
//
//  Created by Rayner Tan Xue Wen on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContactDetailViewController.h"

@interface ContactDetailViewController ()

@end

@implementation ContactDetailViewController
@synthesize titleText, catergoryText, contentText, klause, context;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) close {
    [titleText resignFirstResponder];
    [contentText resignFirstResponder];
}

-(IBAction)save:(id)sender {
    
    [klause setValue:titleText.text forKey:@"title"];
    [klause setValue:contentText.text forKey:@"content"];
    
    [self close];
    
}


-(void) viewWillAppear:(BOOL)animated {
    self.title = klause.title;
    titleText.text = klause.title;
    contentText.text = klause.content;
}


-(BOOL) textFieldShouldReturn: (UITextField *) theTextField
{
    [theTextField resignFirstResponder];
    return YES;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
