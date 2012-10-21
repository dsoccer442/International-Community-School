//
//  SecondViewController.h
//  WebViewTutorial1
//
//  Created by kent franks on 10/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


// Importing of the other webviews
#import <UIKit/UIKit.h>
#import "MyWebView.h"
#import "ASBWebView.h"
#import "FBLAWebView.h"
#import "KeyClubWebView.h"
#import "MockTrialWebView.h"
#import "MUNWebView.h"
#import "NHSWebView.h"
#import "NAHSWebView.h"
#import "SNHSWebView.h"
#import "DramaWebView.h"
#import "EnsembleWebView.h"
#import "ChoirWebView.h"
#import "TasteWebView.h"
#import "EnvWebView.h"
#import "FrisbeeWebView.h"
#import "TechWebview.h"


// Creating the outlets for the .xibs as tableviews
@interface SecondViewController : UIViewController 
{
    NSArray *contentArray;
}

@property (nonatomic, retain) IBOutlet UITableView *myTableView;

@property (nonatomic, retain) IBOutlet ASBWebView *myASBWebView;

@property (nonatomic, retain) IBOutlet FBLAWebView *myFBLAWebView;

@property (nonatomic, retain) IBOutlet KeyClubWebView *myKeyClubWebView;

@property (nonatomic, retain) IBOutlet MockTrialWebView *myMockTrialWebView;

@property (nonatomic, retain) IBOutlet MUNWebView *myMUNWebView;

@property (nonatomic, retain) IBOutlet NHSWebView *myNHSWebView;

@property (nonatomic, retain) IBOutlet NAHSWebView *myNAHSWebView;

@property (nonatomic, retain) IBOutlet SNHSWebView *mySNHSWebView;

@property (nonatomic, retain) IBOutlet DramaWebView *myDramaWebView;

@property (nonatomic, retain) IBOutlet EnsembleWebView *myEnsembleWebView;

@property (nonatomic, retain) IBOutlet ChoirWebView *myChoirWebView;

@property (nonatomic, retain) IBOutlet TasteWebView *myTasteWebView;

@property (nonatomic, retain) IBOutlet EnvWebView *myEnvWebView;

@property (nonatomic, retain) IBOutlet FrisbeeWebView *myFrisbeeWebView;

@property (nonatomic, retain) IBOutlet TechWebView *myTechWebView;

@property (nonatomic, retain) IBOutlet MyWebView *myWebView;

@property (nonatomic, retain) IBOutlet NSArray *contentArray;

@end
