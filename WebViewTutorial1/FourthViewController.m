//
//  FourthViewController.m
//  WebViewTutorial1
//
//  Created by Dylan on 8/29/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

@implementation FourthViewController

@synthesize mediaView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *fullURL = @"https://sites.google.com/site/icsclubsasb/contact";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [contactView loadRequest:requestObj];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc
{
    [super dealloc];
}

@end