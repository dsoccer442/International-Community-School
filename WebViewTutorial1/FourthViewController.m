//
//  FourthViewController.m
//  WebViewTutorial1
//
//  Created by Dylan on 8/29/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "FourthViewController.h"
#import "WebViewTutorial1AppDelegate.h"
#import "DetailMediaController.h"

// Define font size and cell sizing for later
#define FONT_SIZE 18.0f
#define CELL_CONTENT_WIDTH 320.0f
#define CELL_CONTENT_MARGIN 10.0f


@implementation FourthViewController

@synthesize detailMediaControllerData;

// Add buttons for refresh here
- (void)viewDidLoad {
    
}


// One column
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


// As many rows as story items
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [stories count];
}


// Dynamic autowrapping calculations
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
    NSString *testString = [NSString stringWithFormat:@"%@", [[stories objectAtIndex:storyIndex] objectForKey: @"title"]];
    CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    CGSize size = [testString sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    CGFloat height = MAX(size.height, 44.0f);
    return height + (CELL_CONTENT_MARGIN * 2);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Create cell and label
	static NSString *MyIdentifier = @"MyIdentifier";
    UITableViewCell *cell = nil;
    UILabel *mediaCellLabel = nil;
	
	cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    // If cell does not exist make one with a label of a certain size
	if (cell == nil)
    {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier] autorelease];
        
        mediaCellLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [mediaCellLabel setLineBreakMode:UILineBreakModeWordWrap];
        [mediaCellLabel setMinimumFontSize:FONT_SIZE];
        [mediaCellLabel setNumberOfLines:0];
        [mediaCellLabel setFont:[UIFont systemFontOfSize:FONT_SIZE]];
        [mediaCellLabel setTag:1];
        
        [[cell contentView] addSubview:mediaCellLabel];
	}
    
    // Navigation logic
    int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
    
    NSString *testString = [NSString stringWithFormat:@"%@", [[stories objectAtIndex:storyIndex] objectForKey: @"title"]];
    CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    CGSize size = [testString sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    
    if (!mediaCellLabel)
        mediaCellLabel = (UILabel*)[cell viewWithTag:1];
    
    // Setting text of label to item title and remove .jpeg at end
    [mediaCellLabel setText:[[stories objectAtIndex: storyIndex] objectForKey: @"title"]];
    mediaCellLabel.text = [mediaCellLabel.text stringByReplacingOccurrencesOfString:@".jpeg" withString:@""];
    [mediaCellLabel setFrame:CGRectMake(CELL_CONTENT_MARGIN, CELL_CONTENT_MARGIN, CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), MAX(size.height, 44.0f))];
    
    // Setting red background color of cell label and yellow text color
    mediaCellLabel.textColor = [UIColor colorWithRed:0.522 green:0.111 blue:0.048 alpha:1.0];
    mediaCellLabel.font = [UIFont fontWithName:@"Georgia" size:16];

	return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Defining background color of cell as the same as label cell
    //cell.backgroundColor = [UIColor colorWithRed:0.522 green:0.111 blue:0.048 alpha:1.0];
    // Selecting cell turns gray
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic
    
    int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1];
    
    NSString * storyLink = [[stories objectAtIndex: storyIndex] objectForKey: @"link"];
    
    // clean up the link - get rid of spaces, returns, and tabs...
    storyLink = [storyLink stringByReplacingOccurrencesOfString:@" " withString:@""];
    storyLink = [storyLink stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    storyLink = [storyLink stringByReplacingOccurrencesOfString:@"	" withString:@""];
    
    NSURL *storyLinkURL = [NSURL URLWithString:storyLink];
	
    // Push to detail media controller
    DetailMediaController *temp = [[DetailMediaController alloc] initWithNibName:@"DetailMediaController" bundle:[NSBundle mainBundle]];
    self.detailMediaControllerData = temp;
    detailMediaControllerData.passedURL = storyLinkURL;
    [self.navigationController pushViewController:detailMediaControllerData animated:YES];
    
    [temp release];
}


- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
    // RSS feed link
	if ([stories count] == 0) {
		NSString * path = @"http://feeds.feedburner.com/icspictures";
		[self parseXMLFileAtURL:path];
	}
	
	cellSize = CGSizeMake([newsMediaTable bounds].size.width, 60);
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
    [rssParser setShouldProcessNamespaces:NO];
    [rssParser setShouldReportNamespacePrefixes:NO];
    [rssParser setShouldResolveExternalEntities:NO];
	
    [rssParser parse];
	
}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
	NSString * errorString = [NSString stringWithFormat:@"Unable to download story feed from web site (Error code %i )", [parseError code]];
	NSLog(@"error parsing XML: %@", errorString);
	
	UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Error loading content" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[errorAlert show];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{			
    //NSLog(@"found this element: %@", elementName);
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
	[newsMediaTable reloadData];
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
	[stories release];
	[item release];
	[currentTitle release];
	[currentDate release];
	[currentSummary release];
	[currentLink release];
	
	[super dealloc];
}



@end