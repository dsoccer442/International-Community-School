//
//  DetailMediaController.h
//  WebViewTutorial1
//
//  Created by Dylan on 9/25/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailMediaController : UIViewController {
    NSURL *passedURL;
}

@property (nonatomic, retain) NSURL *passedURL;
@property (nonatomic, retain) IBOutlet UIWebView *detailMediaView;


@end
