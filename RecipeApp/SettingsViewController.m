//
//  SettingsViewController.m
//  RecipeApp
//
//  Created by Daniel Grosman on 2017-11-29.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)vegetarianButtonTapped:(UISwitch *)sender {
}
- (IBAction)lactoButtonTapped:(UISwitch *)sender {
}
- (IBAction)veganButtonTapped:(UISwitch *)sender {
}
- (IBAction)pescetarianButtonTapped:(UISwitch *)sender {
}



- (IBAction)backButton:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveButton:(UIBarButtonItem*)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
