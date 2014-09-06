//
//  JSViewController.h
//  BullsEye
//
//  Created by Jean Sung on 9/3/14.
//  Copyright (c) 2014 Jean Sung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSViewController : UIViewController <UIAlertViewDelegate>

@property (nonatomic, weak) IBOutlet UISlider *slider;
@property (nonatomic, weak) IBOutlet UILabel *targetLabel;
@property (nonatomic, weak) IBOutlet UILabel *scoreLabel;
@property (nonatomic, weak) IBOutlet UILabel *roundLabel;
-(IBAction)startOver;
-(IBAction)showAlert;
-(IBAction)sliderMoved:(UISlider *) slider;



@end
