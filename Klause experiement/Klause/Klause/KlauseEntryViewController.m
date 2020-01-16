//
//  KlauseEntryViewController.m
//  Klause
//
//  Created by Rayner Tan Xue Wen on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KlauseEntryViewController.h"
#import "Klause.h"

@interface KlauseEntryViewController ()

@end

@implementation KlauseEntryViewController

@synthesize app;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
        UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:@"New Klause"];
        [navBar pushNavigationItem:navItem animated:NO];
        UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle: @"Cancle"
                                                                         style: UIBarButtonItemStyleBordered
                                                                        target: self
                                                                        action:@selector(cancel)];
        
        UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save"
                                                                       style:UIBarButtonItemStyleBordered
                                                                      target:self
                                                                      action:@selector(add)];
        
        navItem.leftBarButtonItem = cancelButton;
        navItem.rightBarButtonItem = saveButton;
        
        [self.view addSubview:navBar];
        
        app = [[UIApplication sharedApplication] delegate];
        
    }
    return self;
}






-(void) add{
    
    NSManagedObjectContext *context = [app managedObjectContext];
    
    Klause *klause = [NSEntityDescription insertNewObjectForEntityForName:@"Klause" inManagedObjectContext:context];
    
    if (titleText.text.length <= 0 || contentText.text.length <= 0) {
        NSLog(@"Error. Please check if you have entered a title and wrote a Klause");
    }
    else {
        klause.title = titleText.text;
        klause.content = contentText.text;
        klause.tag = tag.text;
        
        
        [self dismissModalViewControllerAnimated:YES];
        
    }
    
}

-(void) cancel{
    [self dismissModalViewControllerAnimated:YES];
}








- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
