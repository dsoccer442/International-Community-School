//
//  FirstViewController.h
//  WebViewTutorial1
//
//  Created by kent franks on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+NSStringTags.h"

@interface FirstViewController : 
UITableViewController {
    UIImageView *mImageView;
	// Adding table view
	IBOutlet UITableView * newsHomeTable;
	// Adding activity indivator view
	UIActivityIndicatorView * activityIndicator;
	// Defining cell size
	CGSize cellSize;
	// RSS parser
	NSXMLParser * rssParser;
    
    //NSString * stringByStrippingHTML;
	// Array for announcements
	NSMutableArray * stories;
	// a temporary item; added to the "stories" array one at a time, and cleared for the next one
	NSMutableDictionary * item;
	// it parses through the document, from top to bottom...
	// we collect and cache each sub-element value, and then save each item to our array.
	// we use these to track each current item, until it's ready to be added to the "stories" array
	NSString * currentElement;
	NSMutableString * currentTitle, * currentDate, * currentSummary, * currentLink;
    
    
}
//
@property (nonatomic, retain) UIImageView *mImageView;

@end