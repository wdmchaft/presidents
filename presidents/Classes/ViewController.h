//
//  ViewController.h
//  presidents
//
//  Created by Will Coughlin on 12/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSImageSidebarView.h"

#import "InfoViewController.h"

@interface ViewController : UIViewController <HSImageSidebarViewDelegate, InfoViewControllerDelegate> {
@public
    HSImageSidebarView *_sidebar;
    NSMutableArray *icons;
    
    IBOutlet UILabel *name;
    IBOutlet UIImageView *profilePic;
    IBOutlet UILabel *indexLabel;
    
    IBOutlet UIImageView *iPad_profilePic;
    IBOutlet UILabel *iPad_name;
    IBOutlet UILabel *iPad_lifespan;
    IBOutlet UILabel *iPad_birthplace;
    IBOutlet UILabel *iPad_party;
    IBOutlet UILabel *iPad_term;
    IBOutlet UILabel *iPad_keyLabel;
    IBOutlet UILabel *iPad_visibleKeyLabel;
    IBOutlet UIButton *iPad_wikiButton;
    IBOutlet UIButton *iPad_whButton;
}

@property (nonatomic, retain) IBOutlet HSImageSidebarView *sidebar;

- (IBAction)showInfo:(id)sender;

- (IBAction)iPad_openWiki:(id)sender;
- (IBAction)iPad_openWHPage:(id)sender;

@end
