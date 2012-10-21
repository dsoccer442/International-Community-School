//
//  DetailMediaController.m
//  WebViewTutorial1
//
//  Created by Dylan on 9/25/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailMediaController.h"

@interface DetailMediaController ()

@end

@implementation DetailMediaController

@synthesize passedURL, detailMediaView;


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
    [detailMediaView loadRequest:requestObj];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [detailMediaView release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
