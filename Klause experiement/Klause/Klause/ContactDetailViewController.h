//
//  ContactDetailViewController.h
//  Klause
//
//  Created by Rayner Tan Xue Wen on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Klause.h"
@interface ContactDetailViewController : UIViewController

@property (nonatomic, retain) IBOutlet UITextField *titleText;
@property (nonatomic, retain) IBOutlet UITextField *catergoryText;
@property (nonatomic, retain) IBOutlet UITextField *contentText;
@property (nonatomic, retain) Klause *klause;
@property (nonatomic, retain) NSManagedObjectContext *context;

-(IBAction)save:(id)sender;

@end
