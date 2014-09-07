//
//  AboutViewController.h
//  BullsEye
//
//  Created by Jean Sung on 9/6/14.
//  Copyright (c) 2014 Jean Sung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIWebView *webView;

-(IBAction)close;

@end
