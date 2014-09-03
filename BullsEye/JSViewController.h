//
//  JSViewController.h
//  BullsEye
//
//  Created by Jean Sung on 9/3/14.
//  Copyright (c) 2014 Jean Sung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSViewController : UIViewController

@property (nonatomic, weak) IBOutlet UISlider *slider;

-(IBAction)showAlert;
-(IBAction)sliderMoved:(UISlider *) slider;



@end
