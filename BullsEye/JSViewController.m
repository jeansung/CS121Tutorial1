//
//  JSViewController.m
//  BullsEye
//
//  Created by Jean Sung on 9/3/14.
//  Copyright (c) 2014 Jean Sung. All rights reserved.
//

#import "JSViewController.h"

@interface JSViewController ()

@end

@implementation JSViewController {
    int _currentValue;
    int _targetValue;
    int _score;
    int _round;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startNewGame];
    [self updateLabels];
    
    
    // slider set up
    
    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    [self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb-Highlighted"];
    [self.slider setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    UIImage *trackLeftImage =
    [[UIImage imageNamed:@"SliderTrackLeft"]
     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)]; [self.slider setMinimumTrackImage:trackLeftImage
                                                                                           forState:UIControlStateNormal];
    UIImage *trackRightImage =
    [[UIImage imageNamed:@"SliderTrackRight"]
     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.slider setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


/*
  method to shows an example pop up alert
 */
- (IBAction)showAlert {
    
    int difference = abs(_targetValue - _currentValue);
    int points = 100 - difference;
    
    //components of the alert object
    NSString *title;
    
    
    if (points == 100) {
        title = @"perfect";
        
        // incentive for getting perfect score
        // double bonus
        points += 100;
    }
    else if (points > 90) {
        NSLog(@"wait..");
        title = @"that's pretty good";
        
        
        // incentive for coming really close 
        if (difference == 1) {
            points += 50;
        }
    }
    else if (points > 80) {
        title = @"decent guess";
    }
    else {
        title = @"you suck";
    }
    
    _score += points;


    
    NSString *message = [NSString stringWithFormat:@"You scored %d points", points];
    
    // alert object
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:title
                              message:message
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    [alertView show];
    
}

/*
 method to display current value of slider
 */

-(IBAction)sliderMoved:(UISlider *)slider {
    _currentValue = lroundf(slider.value);
}


/*
 method to hanlde each round's set up
 */
-(void)startNewRound{
    _round +=1;
    _targetValue = 1 + arc4random_uniform(100);
    _currentValue = 50;
    self.slider.value = _currentValue;
}

/*
 method to update the labels after each round to display current values
 */
-(void) updateLabels {
    self.targetLabel.text = [NSString stringWithFormat: @"%d", _targetValue];
    self.scoreLabel.text = [NSString stringWithFormat: @"%d", _score];
    self.roundLabel.text = [NSString stringWithFormat: @"%d", _round];
}

/*
 method that updates values after alert view has been dismissed
 */

-(void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    [self startNewRound];
    [self updateLabels];
}

-(IBAction)startOver {
    
    // animation for starting over 
    CATransition *transition = [CATransition animation]; transition.type = kCATransitionFade; transition.duration = 1;
    transition.timingFunction = [CAMediaTimingFunction
                                 functionWithName:kCAMediaTimingFunctionEaseOut];
    [self startNewGame];
    [self updateLabels];
    [self.view.layer addAnimation:transition forKey:nil];
    
}

-(void) startNewGame{
    _score = 0;
    _round = 0;
    [self startNewRound];
    
}


/*
 method that automatically removes status bar from in game view
 */
-(BOOL)prefersStatusBarHidden {
    return YES;
}

@end
