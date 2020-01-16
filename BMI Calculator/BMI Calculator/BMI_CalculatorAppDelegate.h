//
//  BMI_CalculatorAppDelegate.h
//  BMI Calculator
//
//  Created by Choi Min Suk on 9/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//Step 1: Add the class (UIViewController subclass)
//Syntax >> @class Classname;
@class MainViewController;

@interface BMI_CalculatorAppDelegate : UIResponder <UIApplicationDelegate>
{
    //Step 2: Declare an objectname for the class
    //Syntax >> Classname *objectname;
    MainViewController *mvc;
}
@property (strong, nonatomic) UIWindow *window;
//Step 3: For every object you declared in interface block, you need to declare its properties
@property (strong, nonatomic)MainViewController *mvc;
@end
