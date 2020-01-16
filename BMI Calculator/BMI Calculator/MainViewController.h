//
//  MainViewController.h
//  BMI Calculator
//
//  Created by Choi Min Suk on 9/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
{
    IBOutlet UILabel *label_BMI, *label_risk;
    IBOutlet UISegmentedControl *segctrl_1;
    IBOutlet UITextField *tf_1, *tf_2;
}
@property (strong, nonatomic) IBOutlet UILabel *label_BMI;
@property (strong, nonatomic) IBOutlet UILabel *label_risk;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segct;
@property (strong, nonatomic) IBOutlet UITextField *tf_1;
@property (strong, nonatomic) IBOutlet UITextField *tf_2;

-(IBAction)calculate:(id)sender;
-(IBAction)dismissKB:(id)sender;
-(IBAction)changeVariable:(id)sender;
@end
