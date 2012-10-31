//
//  FirstViewController.m
//  WebViewTutorial1
//
//  Created by kent franks on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#import "WebViewTutorial1AppDelegate.h"

// Defining font and cell size for dynamic wrapping
#define FONT_SIZE 18.0f
#define CELL_CONTENT_WIDTH 320.0f
#define CELL_CONTENT_MARGIN 10.0f


@implementation FirstViewController
@synthesize mImageView;


- (void)viewDidLoad {
// Adding right bar button for refreshing rss feed
//	UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh:)];
//    self.navigationItem.rightBarButtonItem = button;
//    [button release];
    
    newsHomeTable.tableHeaderView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"header.png"]];

    [super viewDidLoad];

}

// One column table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;

}

// Number of rows is equal to the number of items in the stories array
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [stories count];
}

// Defining how high to make each cell based on the title of each item in the stories array
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
    NSString *testString = [NSString stringWithFormat:@"%@", [[stories objectAtIndex:storyIndex] objectForKey: @"title"]];
    CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    CGSize size = [testString sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    CGFloat height = MAX(size.height, 44.0f);
    return height + (CELL_CONTENT_MARGIN * 2);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	// Defining cell and label
	static NSString *MyIdentifier = @"MyIdentifier";
    UITableViewCell *cell = nil;
    UILabel *homeCellLabel = nil;
    UILabel *descriptionLabel = nil;
	
    // If the cell does not exist, create the cell with a label set to a certain font and size
	cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier] autorelease];
        homeCellLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [homeCellLabel setLineBreakMode:UILineBreakModeWordWrap];
        [homeCellLabel setMinimumFontSize:FONT_SIZE];
        [homeCellLabel setNumberOfLines:0];
        [homeCellLabel setFont:[UIFont systemFontOfSize:FONT_SIZE]];
        [homeCellLabel setTag:1];
                
//        [cell addSubview:homeCellLabel];
        
        descriptionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [descriptionLabel setLineBreakMode:UILineBreakModeWordWrap];
        [descriptionLabel setMinimumFontSize:FONT_SIZE];
        [descriptionLabel setNumberOfLines:0];
        [descriptionLabel setFont:[UIFont systemFontOfSize:FONT_SIZE]];
        [descriptionLabel setTag:2];
        
//        [cell addSubview:descriptionLabel];
	}
    // Creating index path and string for the use in determining height
    int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
    
    NSString *testString = [NSString stringWithFormat:@"%@", [[stories objectAtIndex:storyIndex] objectForKey: @"title"]];
    

    CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);

    CGSize size = [testString sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    
    if (!homeCellLabel)
        homeCellLabel = (UILabel*)[cell viewWithTag:1];

    NSString *tempString = [[stories objectAtIndex: storyIndex] objectForKey: @"title"];
    NSString *strippedString = [tempString stringByStrippingHTML];
    // Setting text and frame size for label
    [homeCellLabel setText:strippedString]; //#TODO description
    [homeCellLabel setFrame:CGRectMake(CELL_CONTENT_MARGIN, CELL_CONTENT_MARGIN, CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), MAX(size.height, 44.0f))];
    // Defining background color of the label cell and text
    //homeCellLabel.backgroundColor = [UIColor colorWithRed:0.522 green:0.111 blue:0.048 alpha:0.5];
    homeCellLabel.textColor = [UIColor colorWithRed:0.522 green:0.111 blue:0.048 alpha:1.0];
    homeCellLabel.font = [UIFont fontWithName:@"Georgia" size:16];
    
    if (!descriptionLabel)
        descriptionLabel = (UILabel*)[cell viewWithTag:2];
    
    NSString *tempString2 = [[stories objectAtIndex: storyIndex] objectForKey: @"summary"];
    NSString *strippedString2 = [tempString2 stringByStrippingHTML];
    // Setting text and frame size for label
    [descriptionLabel setText:strippedString2]; //#TODO description
    [descriptionLabel setFrame:CGRectMake(CELL_CONTENT_MARGIN, CELL_CONTENT_MARGIN, CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), MAX(size.height, 44.0f))];
    // Defining background color of the label cell and text
    descriptionLabel.textColor = [UIColor grayColor];
    descriptionLabel.font = [UIFont fontWithName:@"Georgia" size:14];
//        
    
    
    [cell.textLabel setText:strippedString];
    [cell.textLabel setLineBreakMode:UILineBreakModeWordWrap];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.textColor = [UIColor colorWithRed:0.522 green:0.111 blue:0.048 alpha:1.0];
    cell.textLabel.font = [UIFont fontWithName:@"Georgia" size:16];
    [cell.detailTextLabel setText:strippedString2];
    cell.detailTextLabel.textColor = [UIColor grayColor];
    cell.detailTextLabel.font = [UIFont fontWithName:@"Georgia" size:14];
    cell.detailTextLabel.numberOfLines = 0;
	return cell;
}



- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Defining background color of cell as the same as label cell
    cell.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];

    // Selecting cell does not highlight it
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}


// Making a URL to push to detailed view if desired (web view of announcement)
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
//    
//    NSString * storyLink = [[stories objectAtIndex: storyIndex] objectForKey: @"link"];
//    
//    // Clean up the link - get rid of spaces, returns, and tabs...
//    storyLink = [storyLink stringByReplacingOccurrencesOfString:@" " withString:@""];
//    storyLink = [storyLink stringByReplacingOccurrencesOfString:@"\n" withString:@""];
//    storyLink = [storyLink stringByReplacingOccurrencesOfString:@"	" withString:@""];
//    
    // Creating URL from the storyLink string
//    NSURL *storyLinkURL = [NSURL URLWithString:storyLink];

//    if (self.detailHomeControllerData == nil) {
//        DetailHomeController *temp = [[DetailHomeController alloc] initWithNibName:@"DetailHomeController" bundle:[NSBundle mainBundle]];
//        self.detailHomeControllerData = temp;
//        detailHomeControllerData.passedURL = storyLinkURL;
//    }
//    [self.navigationController pushViewController:detailHomeControllerData animated:YES];
//}


- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}


// Obtain story feed from rss feed
- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	if ([stories count] == 0) {
		NSString * path = @"http://feeds.feedburner.com/google/mUzI";
		[self parseXMLFileAtURL:path];
	}
	
	cellSize = CGSizeMake([newsHomeTable bounds].size.width, 60);
}


- (void)viewWillDisappear:(BOOL)animated {
}


- (void)viewDidDisappear:(BOOL)animated {
}


- (void)parserDidStartDocument:(NSXMLParser *)parser{	
	NSLog(@"found file and started parsing");	
}


- (void)parseXMLFileAtURL:(NSString *)URL
{	
	stories = [[NSMutableArray alloc] init];
	
    //you must then convert the path to a proper NSURL or it won't work
    NSURL *xmlURL = [NSURL URLWithString:URL];
	
    // here, for some reason you have to use NSClassFromString when trying to alloc NSXMLParser, otherwise you will get an object not found error
    // this may be necessary only for the toolchain
    rssParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
	
    // Set self as the delegate of the parser so that it will receive the parser delegate methods callbacks.
    [rssParser setDelegate:self];
	
    // Depending on the XML document you're parsing, you may want to enable these features of NSXMLParser.
    [rssParser setShouldProcessNamespaces:YES];
    [rssParser setShouldReportNamespacePrefixes:YES];
    [rssParser setShouldResolveExternalEntities:YES];
	
    [rssParser parse];
}


- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSString * errorString = [NSString stringWithFormat:@"Check your internet connection!", [parseError code]];
	NSLog(@"error parsing XML: %@", errorString);
	
	UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Oops..." message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{			
//    NSLog(@"found this element: %@", elementName);
	currentElement = [elementName copy];
	if ([elementName isEqualToString:@"item"]) {
		// clear out our story item caches...
		item = [[NSMutableDictionary alloc] init];
		currentTitle = [[NSMutableString alloc] init];
		currentDate = [[NSMutableString alloc] init];
		currentSummary = [[NSMutableString alloc] init];
		currentLink = [[NSMutableString alloc] init];
	}
	
}


- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{     
	//NSLog(@"ended element: %@", elementName);
	if ([elementName isEqualToString:@"item"]) {
		// save values to an item, then store that item into the array...
		[item setObject:currentTitle forKey:@"title"];
		[item setObject:currentLink forKey:@"link"];
		[item setObject:currentSummary forKey:@"summary"];
		[item setObject:currentDate forKey:@"date"];
		
		[stories addObject:[item copy]];
		NSLog(@"adding story: %@", currentTitle);
	}
	
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	//NSLog(@"found characters: %@", string);
	// save the characters for the current item...
	if ([currentElement isEqualToString:@"title"]) {
		[currentTitle appendString:string];
	} else if ([currentElement isEqualToString:@"link"]) {
		[currentLink appendString:string];
	} else if ([currentElement isEqualToString:@"description"]) {
		[currentSummary appendString:string];
	} else if ([currentElement isEqualToString:@"pubDate"]) {
		[currentDate appendString:string];
	}
	
}


- (void)parserDidEndDocument:(NSXMLParser *)parser {
	
	[activityIndicator stopAnimating];
	[activityIndicator removeFromSuperview];
	
	NSLog(@"all done!");
	NSLog(@"stories array has %d items", [stories count]);
	[newsHomeTable reloadData];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (void)dealloc {
	
	[currentElement release];
	[rssParser release];
	[stories release], stories = nil;
	[item release];
	[currentTitle release];
	[currentDate release];
	[currentSummary release];
	[currentLink release];
	
	[super dealloc];
}


@end