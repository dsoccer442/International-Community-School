//
//  DetailCalendarController.m
//  WebViewTutorial1
//
//  Created by Dylan on 9/25/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//
#import "DetailCalendarController.h"


@interface DetailCalendarController ()

@end

@implementation DetailCalendarController

@synthesize passedURL, detailCalendarView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:passedURL];
    [detailCalendarView loadRequest:requestObj];
    
//    NSString *passedURLString = [NSString stringWithFormat:@"%@", passedURL];
//    NSLog(passedURLString);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [detailCalendarView release];
    [passedURL release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
