//
//  DetailCalendarController.h
//  WebViewTutorial1
//
//  Created by Dylan on 9/25/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailCalendarController : UIViewController {
    NSURL *passedURL;
}

@property (nonatomic, retain) NSURL *passedURL;
@property (nonatomic, retain) IBOutlet UIWebView *detailCalendarView;


@end
