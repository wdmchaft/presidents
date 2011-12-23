//
//  InfoViewController.m
//  presidents
//
//  Created by Will Coughlin on 12/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "InfoViewController.h"
#import "ViewController.h"

@implementation InfoViewController
@synthesize delegate = _delegate;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
    
}

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

- (void)initWithKeyOfPresident:(NSString *)key {
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"presidents" ofType:@"plist"];
	NSLog(@"%@", filePath);
    NSDictionary *plistDictionary = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    NSArray *presArray = [plistDictionary objectForKey:key];
    
    profilePic.image = [UIImage imageNamed:[presArray objectAtIndex:6]];
    name.text = [presArray objectAtIndex:0];
    lifespan.text = [presArray objectAtIndex:1];
    birthplace.text = [presArray objectAtIndex:2];
    party.text = [presArray objectAtIndex:4];
    term.text = [presArray objectAtIndex:3];
    keyLabel.text = key;
    NSString *presNumber = [NSString stringWithFormat:@"#%i", [key intValue]+1];
    visibleKeyLabel.text = presNumber;
}

- (IBAction)openWiki:(id)sender 
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"presidents" ofType:@"plist"];
	NSLog(@"%@", filePath);
    NSDictionary *plistDictionary = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    NSArray *presArray = [plistDictionary objectForKey:keyLabel.text];
    NSArray *urls = [presArray objectAtIndex:5];
    
    SVModalWebViewController *webViewController = [[SVModalWebViewController alloc] initWithAddress:[urls objectAtIndex:0]];
    [self presentModalViewController:webViewController animated:YES];	
    [webViewController release];
}
- (IBAction)openWHPage:(id)sender 
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"presidents" ofType:@"plist"];
	NSLog(@"%@", filePath);
    NSDictionary *plistDictionary = [[NSDictionary alloc] initWithContentsOfFile:filePath];
    NSArray *presArray = [plistDictionary objectForKey:keyLabel.text];
    NSArray *urls = [presArray objectAtIndex:5];
    
    SVModalWebViewController *webViewController = [[SVModalWebViewController alloc] initWithAddress:[urls objectAtIndex:1]];
    [self presentModalViewController:webViewController animated:YES];	
    [webViewController release];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    UISwipeGestureRecognizer *swipeDown = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDown:)] autorelease];
    [swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [[self view] addGestureRecognizer:swipeDown];
    [self registerDefaultsFromSettingsBundle];
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

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate infoViewControllerDidFinish:self];
}

- (void)swipeDown:(UISwipeGestureRecognizer *)recognizer  
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"useGestures"]) {
    
        CGPoint point = [recognizer locationInView:[self view]];
        NSString *output = [NSString stringWithFormat:@"Action: Swipe Down - %f, %f", point.x, point.y];
        NSLog(@"%@", output);
        
        [self done:self];
    
    } else {
        NSLog(@"Gestures are off, doing nothing.");
    }
}

@end
