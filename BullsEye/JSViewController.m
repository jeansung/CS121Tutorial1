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
    
    
    [self startNewRound];
    [self updateLabels];
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
    _score += points;
    
    NSString *message = [NSString stringWithFormat:@"You scored %d points", points];
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Hello, World"
                              message:message
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    [alertView show];
    
    [self startNewRound];
    [self updateLabels];
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
    
    // modified code so that slider does not reset to halfway at the
    // start of each round
    _currentValue = 1 + arc4random_uniform(100);
    self.slider.value = _currentValue;
}

-(void) updateLabels {
    self.targetLabel.text = [NSString stringWithFormat: @"%d", _targetValue];
    self.scoreLabel.text = [NSString stringWithFormat: @"%d", _score];
    self.roundLabel.text = [NSString stringWithFormat: @"%d", _round];
}

@end
