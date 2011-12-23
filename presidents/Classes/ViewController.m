//
//  ViewController.m
//  presidents
//
//  Created by Will Coughlin on 12/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "ViewController.h"

@implementation ViewController
@synthesize sidebar = _sidebar;

id key;

- (void)registerDefaultsFromSettingsBundle
{
    NSLog(@"Registering default values from Settings.bundle");
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    [defs synchronize];
    
    NSString *settingsBundle = [[NSBundle mainBundle] pathForResource:@"Settings" ofType:@"bundle"];
    
    if(!settingsBundle)
    {
        NSLog(@"Could not find Settings.bundle");
        return;
    }
    
    NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile:[settingsBundle stringByAppendingPathComponent:@"Root.plist"]];
    NSArray *preferences = [settings objectForKey:@"PreferenceSpecifiers"];
    NSMutableDictionary *defaultsToRegister = [[NSMutableDictionary alloc] initWithCapacity:[preferences count]];
    
    for (NSDictionary *prefSpecification in preferences)
    {
        NSString *key = [prefSpecification objectForKey:@"Key"];
        if (key)
        {
            // check if value readable in userDefaults
            id currentObject = [defs objectForKey:key];
            if (currentObject == nil)
            {
                // not readable: set value from Settings.bundle
                id objectToSet = [prefSpecification objectForKey:@"DefaultValue"];
                [defaultsToRegister setObject:objectToSet forKey:key];
                NSLog(@"Setting object %@ for key %@", objectToSet, key);
            }
            else
            {
                // already readable: don't touch
                NSLog(@"Key %@ is readable (value: %@), nothing written to defaults.", key, currentObject);
            }
        }
    }
    
    [defs registerDefaults:defaultsToRegister];
    [defaultsToRegister release];
    [defs synchronize];
}

- (void)viewDidLoad 
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
    
    [self registerDefaultsFromSettingsBundle];
    
    _sidebar.delegate = self;
	
	icons = [[NSMutableArray alloc] init];
	
	for (int i=0; i<44; ++i)
		[icons addObject:[NSNumber numberWithInt:i]];
    
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {

        iPad_profilePic.image = [UIImage imageNamed:@"0.jpg"];
        iPad_name.text = @"George Washington";
        iPad_lifespan.text = @"February 22, 1732 – December 14, 1799";
        iPad_birthplace.text = @"Westmoreland, Virginia";
        iPad_party.text = @"Non-partisan";
        iPad_term.text = @"April 30, 1789 – March 4, 1797";
        iPad_keyLabel.text = @"0";
        NSString *presNumber = [NSString stringWithFormat:@"#%i", 1];
        iPad_visibleKeyLabel.text = presNumber;
        
    } else {
        profilePic.image = [UIImage imageNamed:@"0.jpg"];
        
        name.text = @"George Washington";
        
        UISwipeGestureRecognizer *swipeUp = 
        [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeUp:)] autorelease];
        [swipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
        [[self view] addGestureRecognizer:swipeUp];
    }
    
    indexLabel.text = @"0";
    
    UISwipeGestureRecognizer *swipeLeft = 
    [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)] autorelease];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [[self view] addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = 
    [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)] autorelease];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [[self view] addGestureRecognizer:swipeRight];
    
    
    
}

- (NSUInteger)countOfImagesInSidebar:(HSImageSidebarView *)sidebar 
{
	return [icons count];
}

- (UIImage *)sidebar:(HSImageSidebarView *)sidebar imageForIndex:(NSUInteger)anIndex 
{
	int icon = [[icons objectAtIndex:anIndex] intValue];
	switch (icon) {
		case 0:
			return [UIImage imageNamed:@"i0"];
		case 1:
			return [UIImage imageNamed:@"i1"];
		case 2:
			return [UIImage imageNamed:@"i2"];
        case 3:
			return [UIImage imageNamed:@"i3"];
        case 4:
			return [UIImage imageNamed:@"i4"];
        case 5:
			return [UIImage imageNamed:@"i5"];
        case 6:
			return [UIImage imageNamed:@"i6"];
        case 7:
			return [UIImage imageNamed:@"i7"];
        case 8:
			return [UIImage imageNamed:@"i8"];
        case 9:
			return [UIImage imageNamed:@"i9"];
        case 10:
			return [UIImage imageNamed:@"i10"];
        case 11:
			return [UIImage imageNamed:@"i11"];
        case 12:
			return [UIImage imageNamed:@"i12"];
        case 13:
			return [UIImage imageNamed:@"i13"];
        case 14:
			return [UIImage imageNamed:@"i14"];
        case 15:
			return [UIImage imageNamed:@"i15"];
        case 16:
			return [UIImage imageNamed:@"i16"];
        case 17:
			return [UIImage imageNamed:@"i17"];
        case 18:
			return [UIImage imageNamed:@"i18"];
        case 19:
			return [UIImage imageNamed:@"i19"];
        case 20:
			return [UIImage imageNamed:@"i20"];
        case 21:
			return [UIImage imageNamed:@"i21"];
        case 22:
			return [UIImage imageNamed:@"i22"];
        case 23:
			return [UIImage imageNamed:@"i23"];
        case 24:
			return [UIImage imageNamed:@"i24"];
        case 25:
			return [UIImage imageNamed:@"i25"];
        case 26:
			return [UIImage imageNamed:@"i26"];
        case 27:
			return [UIImage imageNamed:@"i27"];
        case 28:
			return [UIImage imageNamed:@"i28"];
        case 29:
			return [UIImage imageNamed:@"i29"];
        case 30:
			return [UIImage imageNamed:@"i30"];
        case 31:
			return [UIImage imageNamed:@"i31"];
        case 32:
			return [UIImage imageNamed:@"i32"];
        case 33:
			return [UIImage imageNamed:@"i33"];
        case 34:
			return [UIImage imageNamed:@"i34"];
        case 35:
			return [UIImage imageNamed:@"i35"];
        case 36:
			return [UIImage imageNamed:@"i36"];
        case 37:
			return [UIImage imageNamed:@"i37"];
        case 38:
			return [UIImage imageNamed:@"i38"];
        case 39:
			return [UIImage imageNamed:@"i39"];
        case 40:
			return [UIImage imageNamed:@"i40"];
        case 41:
			return [UIImage imageNamed:@"i41"];
        case 42:
			return [UIImage imageNamed:@"i42"];
        case 43:
			return [UIImage imageNamed:@"i43"];
			
	}
    return  nil;
}

-(void)sidebar:(HSImageSidebarView *)sidebar didTapImageAtIndex:(NSUInteger)anIndex 
{
	NSLog(@"Touched image at index: %u", anIndex);
    
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"presidents" ofType:@"plist"];
    NSLog(@"%@", filePath);
    NSDictionary *plistDictionary = [[[NSDictionary alloc] initWithContentsOfFile:filePath] autorelease];
    
    key = [NSString stringWithFormat:@"%i", anIndex];
    NSArray *presArray = [plistDictionary objectForKey:key];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        iPad_profilePic.image = [UIImage imageNamed:[presArray objectAtIndex:7]];
        iPad_name.text = [presArray objectAtIndex:0];
        iPad_lifespan.text = [presArray objectAtIndex:1];
        iPad_birthplace.text = [presArray objectAtIndex:2];
        iPad_party.text = [presArray objectAtIndex:4];
        iPad_term.text = [presArray objectAtIndex:3];
        iPad_keyLabel.text = key;
        NSString *presNumber = [NSString stringWithFormat:@"#%i", [key intValue]+1];
        iPad_visibleKeyLabel.text = presNumber;
        
    } else {
        name.text = [presArray objectAtIndex:0]; 
        NSLog(@"%@", presArray);
        NSString *imgpath = [NSString stringWithFormat:@"%@.jpg", key];
        profilePic.image = [UIImage imageNamed:imgpath];
        NSLog(@"%@", imgpath);
    
        indexLabel.text = [NSString stringWithFormat:@"%i", anIndex];
    }
}

- (IBAction)iPad_openWiki:(id)sender 
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"presidents" ofType:@"plist"];
	NSLog(@"%@", filePath);
    NSDictionary *plistDictionary = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    NSArray *presArray = [plistDictionary objectForKey:indexLabel.text];
    NSArray *urls = [presArray objectAtIndex:5];
    
    SVModalWebViewController *webViewController = [[SVModalWebViewController alloc] initWithAddress:[urls objectAtIndex:0]];
    [self presentModalViewController:webViewController animated:YES];	
    [webViewController release];
}
- (IBAction)iPad_openWHPage:(id)sender 
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"presidents" ofType:@"plist"];
	NSLog(@"%@", filePath);
    NSDictionary *plistDictionary = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    NSArray *presArray = [plistDictionary objectForKey:iPad_keyLabel.text];
    NSArray *urls = [presArray objectAtIndex:5];
    
    SVModalWebViewController *webViewController = [[SVModalWebViewController alloc] initWithAddress:[urls objectAtIndex:1]];
    [self presentModalViewController:webViewController animated:YES];	
    [webViewController release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown) && (interfaceOrientation != UIInterfaceOrientationLandscapeRight) && (interfaceOrientation != UIInterfaceOrientationLandscapeLeft);
    return NO;
}

- (void)infoViewControllerDidFinish:(InfoViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo:(id)sender
{    
    InfoViewController *controller = [[[InfoViewController alloc] initWithNibName:@"InfoViewController" bundle:nil] autorelease];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentModalViewController:controller animated:YES];
    //[controller initWithKeyOfPresident:key];
    //NSLog(key);
    [controller initWithKeyOfPresident:indexLabel.text];
}

- (void)swipeUp:(UISwipeGestureRecognizer *)recognizer  
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"useGestures"]) {
        CGPoint point = [recognizer locationInView:[self view]];
        NSString *output = [NSString stringWithFormat:@"Action: Swipe Up - %f, %f", point.x, point.y];
        NSLog(@"%@", output);
        
        [self showInfo:self];
    } else {
        NSLog(@"Gestures are off, doing nothing.");     
    }
}

- (void)swipeLeft:(UISwipeGestureRecognizer *)recognizer 
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"useGestures"]) {
        CGPoint point = [recognizer locationInView:[self view]];
        NSString *output = [NSString stringWithFormat:@"Action: Swipe Left - %f, %f", point.x, point.y];
        NSLog(@"%@", output);
        
        if([indexLabel.text intValue] < 43)
            [self sidebar:_sidebar didTapImageAtIndex:[indexLabel.text intValue]+1];

    } else {
        NSLog(@"Gestures are off, doing nothing.");
    }
}


- (void)swipeRight:(UISwipeGestureRecognizer *)recognizer 
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"useGestures"]) {
        CGPoint point = [recognizer locationInView:[self view]];
        NSString *output = [NSString stringWithFormat:@"Action: Swipe Right - %f, %f", point.x, point.y];
        NSLog(@"%@", output);
        
        if([indexLabel.text intValue] > 0)
            [self sidebar:_sidebar didTapImageAtIndex:[indexLabel.text intValue]-1];
    } else {
        NSLog(@"Gestures are off, doing nothing.");
    }
}


- (void)dealloc 
{
    [super dealloc];
}

@end
