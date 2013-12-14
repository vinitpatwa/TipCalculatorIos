//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Vinit Patwa on 12/13/13.
//  Copyright (c) 2013 Vinit Patwa. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *settingsControl;

- (void) updateSettings;
- (IBAction)onSettingsChanged:(id)sender;
@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Settings";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        [self readSettings];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) updateSettings
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.settingsControl.selectedSegmentIndex  forKey:@"default_tip"];
    [defaults synchronize];
    NSLog(@"set:%d", self.settingsControl.selectedSegmentIndex);
    
}

- (void) readSettings{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"default_tip"];
    NSLog(@"reading Value:%d",intValue);
    [self.settingsControl setSelectedSegmentIndex:intValue];
}

- (IBAction)onSettingsChanged:(id)sender{
    [self updateSettings];
}

@end
