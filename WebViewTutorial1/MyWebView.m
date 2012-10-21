//
//  MyWebView.m
//  WebViewTutorial1
//
//  Created by kent franks on 10/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyWebView.h"
#import "SecondViewController.h"


@implementation MyWebView

@synthesize ourWebView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *urlAddress = [[NSBundle mainBundle] pathForResource:@"cnn" ofType:@"html"];
        NSURL *url = [NSURL fileURLWithPath:urlAddress];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        [ourWebView loadRequest:requestObj];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
