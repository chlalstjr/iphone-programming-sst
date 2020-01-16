//
//  KlauseEntryViewController.h
//  Klause
//
//  Created by Rayner Tan Xue Wen on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface KlauseEntryViewController : UIViewController
{
    IBOutlet UITextField *titleText;
    IBOutlet UITextField *contentText;
    IBOutlet UITextField *tag;
    IBOutlet UIButton *favourite;
}

@property (nonatomic, retain) AppDelegate *app;

@end
