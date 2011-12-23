//
//  InfoViewController.h
//  presidents
//
//  Created by Will Coughlin on 12/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SVModalWebViewController.h"

@class InfoViewController;

@protocol InfoViewControllerDelegate
- (void)infoViewControllerDidFinish:(InfoViewController *)controller;
@end

@interface InfoViewController : UIViewController {
@public
    IBOutlet UIImageView *profilePic;
    IBOutlet UILabel *name;
    IBOutlet UILabel *lifespan;
    IBOutlet UILabel *birthplace;
    IBOutlet UILabel *party;
    IBOutlet UILabel *term;
    IBOutlet UILabel *keyLabel;
    IBOutlet UILabel *visibleKeyLabel;
    IBOutlet UIButton *wikiButton;
    IBOutlet UIButton *whButton;
}



@property (assign, nonatomic) IBOutlet id <InfoViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

- (IBAction)openWiki:(id)sender;
- (IBAction)openWHPage:(id)sender;

- (void)initWithKeyOfPresident:(NSString *)key;

@end