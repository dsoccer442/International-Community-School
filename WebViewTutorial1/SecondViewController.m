//
//  SecondViewController.m
//  WebViewTutorial1
//
//  Created by kent franks on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"
#define FONT_SIZE 18.0f


@implementation SecondViewController

@synthesize myTableView, myWebView, contentArray, myASBWebView, myFBLAWebView, myKeyClubWebView, myMockTrialWebView, myMUNWebView, myNHSWebView, myNAHSWebView, mySNHSWebView, myDramaWebView, myEnsembleWebView, myChoirWebView, myTasteWebView, myEnvWebView, myFrisbeeWebView, myTechWebView;


// Creating individual cell names manually
- (void)viewDidLoad
{
    contentArray = [[NSArray arrayWithObjects:@"ASB", @"FBLA", @"Key Club", @"Mock Trial", @"MUN", @"NHS", @"NAHS", @"SNHS", @"Drama", @"Ensemble", @"Choir", @"Taste of ICS", @"Environmental Club", @"Ultimate Frisbee", @"Tech Crew", nil] retain];
    [super viewDidLoad];
}


#pragma mark - Table view data source
// One column in table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// Number of clubs in content array defines number of rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [contentArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Creating identity and cell
    static NSString *identity = @"MainCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    
    // If cell does not exist, create one
    if(cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:identity] autorelease];
    }
    
    // Text of cell is the name of items in content array
    cell.text = [contentArray objectAtIndex:indexPath.row];
    [cell.textLabel setMinimumFontSize:FONT_SIZE];
    [cell.textLabel setFont:[UIFont systemFontOfSize:FONT_SIZE]];
    // Background of text label is red and text color is yellow
    cell.textLabel.backgroundColor = [UIColor colorWithRed:0.522 green:0.111 blue:0.048 alpha:1.0];
    cell.textLabel.textColor = [UIColor yellowColor];

    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Background of cell is red and when selecting it gray
    cell.backgroundColor = [UIColor colorWithRed:0.522 green:0.111 blue:0.048 alpha:1.0];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    // If ASB is clicked, load ASB .xib
    if ([cell.textLabel.text isEqualToString:@"ASB"]) {
        if (self.myASBWebView == nil) {
            ASBWebView *temp = [[ASBWebView alloc] initWithNibName:@"ASBWebView" bundle: [NSBundle mainBundle]];
            self.myASBWebView = temp;
            [temp release];
        }
        [self.navigationController pushViewController:myASBWebView animated:YES];
    }   
    
    // If FBLA is clicked, load FBLA .xib
    else if ([cell.textLabel.text isEqualToString:@"FBLA"]) {
        if (self.myFBLAWebView == nil) {
            FBLAWebView *temp = [[FBLAWebView alloc] initWithNibName:@"FBLAWebView" bundle: [NSBundle mainBundle]];
            self.myFBLAWebView = temp;
            [temp release];
        }
        [self.navigationController pushViewController:myFBLAWebView animated:YES];
    }
    
        // If Key Club is clicked, load Key Club .xib
    else if ([cell.textLabel.text isEqualToString:@"Key Club"]) {
        if (self.myKeyClubWebView == nil) {
            KeyClubWebView *temp = [[KeyClubWebView alloc] initWithNibName:@"KeyClubWebView" bundle: [NSBundle mainBundle]];
            self.myKeyClubWebView = temp;
            [temp release];
        }
        [self.navigationController pushViewController:myKeyClubWebView animated:YES];
    }
    
        // If Mock is clicked, load Mock .xib
    else if ([cell.textLabel.text isEqualToString:@"Mock Trial"]) {
        if (self.myMockTrialWebView == nil) {
            MockTrialWebView *temp = [[MockTrialWebView alloc] initWithNibName:@"MockTrialWebView" bundle: [NSBundle mainBundle]];
            self.myMockTrialWebView = temp;
            [temp release];
        }
        [self.navigationController pushViewController:myMockTrialWebView animated:YES];
    }
    
        // If MUN is clicked, load MUN .xib
    else if ([cell.textLabel.text isEqualToString:@"MUN"]) {
        if (self.myMUNWebView == nil) {
            MUNWebView *temp = [[MUNWebView alloc] initWithNibName:@"MUNWebView" bundle: [NSBundle mainBundle]];
            self.myMUNWebView = temp;
            [temp release];
        }
        [self.navigationController pushViewController:myMUNWebView animated:YES];
    }
    
        // If NHS is clicked, load NHS .xib
    else if ([cell.textLabel.text isEqualToString:@"NHS"]) {
        if (self.myNHSWebView == nil) {
            NHSWebView *temp = [[NHSWebView alloc] initWithNibName:@"NHSWebView" bundle: [NSBundle mainBundle]];
            self.myNHSWebView = temp;
            [temp release];
        }
        [self.navigationController pushViewController:myNHSWebView animated:YES];
    }
    
        // If NAHS is clicked, load NAHS .xib
    else if ([cell.textLabel.text isEqualToString:@"NAHS"]) {
        if (self.myNAHSWebView == nil) {
            NAHSWebView *temp = [[NAHSWebView alloc] initWithNibName:@"NAHSWebView" bundle: [NSBundle mainBundle]];
            self.myNAHSWebView = temp;
            [temp release];
        }
        [self.navigationController pushViewController:myNAHSWebView animated:YES];
    }
    
        // If SNHS is clicked, load SNHS .xib
    else if ([cell.textLabel.text isEqualToString:@"SNHS"]) {
        if (self.mySNHSWebView == nil) {
            SNHSWebView *temp = [[SNHSWebView alloc] initWithNibName:@"SNHSWebView" bundle: [NSBundle mainBundle]];
            self.mySNHSWebView = temp;
            [temp release];
        }
        [self.navigationController pushViewController:mySNHSWebView animated:YES];
    }
    
        // If Drama is clicked, load Drama .xib
    else if ([cell.textLabel.text isEqualToString:@"Drama"]) {
        if (self.myDramaWebView == nil) {
            DramaWebView *temp = [[DramaWebView alloc] initWithNibName:@"DramaWebView" bundle: [NSBundle mainBundle]];
            self.myDramaWebView = temp;
            [temp release];
        }
        [self.navigationController pushViewController:myDramaWebView animated:YES];
    }
    
        // If Ensemble is clicked, load Ensemble .xib
    else if ([cell.textLabel.text isEqualToString:@"Ensemble"]) {
        if (self.myEnsembleWebView == nil) {
            EnsembleWebView *temp = [[EnsembleWebView alloc] initWithNibName:@"EnsembleWebView" bundle: [NSBundle mainBundle]];
            self.myEnsembleWebView = temp;
            [temp release];
        }
        [self.navigationController pushViewController:myEnsembleWebView animated:YES];
    }
    
        // If Choir is clicked, load Choir .xib
    else if ([cell.textLabel.text isEqualToString:@"Choir"]) {
        if (self.myChoirWebView == nil) {
            ChoirWebView *temp = [[ChoirWebView alloc] initWithNibName:@"ChoirWebView" bundle: [NSBundle mainBundle]];
            self.myChoirWebView = temp;
            [temp release];
        }
        [self.navigationController pushViewController:myChoirWebView animated:YES];
    }
    
        // If Taste is clicked, load Taste .xib
    else if ([cell.textLabel.text isEqualToString:@"Taste of ICS"]) {
        if (self.myTasteWebView == nil) {
            TasteWebView *temp = [[TasteWebView alloc] initWithNibName:@"TasteWebView" bundle: [NSBundle mainBundle]];
            self.myTasteWebView = temp;
            [temp release];
        }
        [self.navigationController pushViewController:myTasteWebView animated:YES];
    }
    
        // If Envi Club is clicked, load Envi Club .xib
    else if ([cell.textLabel.text isEqualToString:@"Environmental Club"]) {
        if (self.myEnvWebView == nil) {
            EnvWebView *temp = [[EnvWebView alloc] initWithNibName:@"EnvWebView" bundle: [NSBundle mainBundle]];
            self.myEnvWebView = temp;
            [temp release];
        }
        [self.navigationController pushViewController:myEnvWebView animated:YES];
    }
    
        // If Frisbee is clicked, load Frisbee .xib
    else if ([cell.textLabel.text isEqualToString:@"Ultimate Frisbee"]) {
        if (self.myFrisbeeWebView == nil) {
            FrisbeeWebView *temp = [[FrisbeeWebView alloc] initWithNibName:@"FrisbeeWebView" bundle: [NSBundle mainBundle]];
            self.myFrisbeeWebView = temp;
            [temp release];
        }
        [self.navigationController pushViewController:myFrisbeeWebView animated:YES];
    }
    
        // If Tech Crew is clicked, load Tech Crew .xib
    else if ([cell.textLabel.text isEqualToString:@"Tech Crew"]) {
        if (self.myTechWebView == nil) {
            TechWebView *temp = [[TechWebView alloc] initWithNibName:@"TechWebView" bundle: [NSBundle mainBundle]];
            self.myTechWebView = temp;
            [temp release];
        }
        [self.navigationController pushViewController:myTechWebView animated:YES];
    }
}


- (void)viewWillAppear:(BOOL)animated
{
	// Unselect the selected row if any
	NSIndexPath*	selection = [self.myTableView indexPathForSelectedRow];
	if (selection)
		[self.myTableView deselectRowAtIndexPath:selection animated:YES];
    
	[self.myTableView reloadData];
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
