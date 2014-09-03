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

@implementation JSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
  method to shows an example pop up alert
 */
- (IBAction)showAlert {
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Hello, World" message:@"This is my first app!" delegate:nil cancelButtonTitle:@"Awesome" otherButtonTitles:nil];
    [alertView show];
}

@end
