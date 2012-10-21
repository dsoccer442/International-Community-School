//
//  FirstViewController.h
//  WebViewTutorial1
//
//  Created by kent franks on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UITableViewController {
	// Adding table view
	IBOutlet UITableView * newsHomeTable;
	// Adding activity indivator view
	UIActivityIndicatorView * activityIndicator;
	// Defining cell size
	CGSize cellSize;
	// RSS parser
	NSXMLParser * rssParser;
	// Array for announcements
	NSMutableArray * stories;
	// a temporary item; added to the "stories" array one at a time, and cleared for the next one
	NSMutableDictionary * item;
	// it parses through the document, from top to bottom...
	// we collect and cache each sub-element value, and then save each item to our array.
	// we use these to track each current item, until it's ready to be added to the "stories" array
	NSString * currentElement;
	NSMutableString * currentTitle, * currentDate, * currentSummary, * currentLink;
    
    UIImageView *mImageView;
}

@property(nonatomic, retain) IBOutlet UIImageView *mImageView;

@end
