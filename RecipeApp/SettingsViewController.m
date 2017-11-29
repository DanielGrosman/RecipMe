//
//  SettingsViewController.m
//  RecipeApp
//
//  Created by Daniel Grosman on 2017-11-29.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *settingsImage;
@property (strong, nonatomic) NSMutableString *mutableURLString;
@property (weak, nonatomic) IBOutlet UISwitch *vegetarianSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *lactoSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *veganSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *pescatarianSwitch;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.vegetarianSwitch.on = [defaults boolForKey:@"vegetarianButtonStatus"];
    self.lactoSwitch.on = [defaults boolForKey:@"lactoButtonStatus"];
    self.veganSwitch.on = [defaults boolForKey:@"veganButtonStatus"];
    self.pescatarianSwitch.on = [defaults boolForKey:@"pescatarianButtonStatus"];
    self.mutableURLString = [[NSMutableString alloc] init];

    self.settingsImage.image = [UIImage imageNamed:@"settings"];
}

- (IBAction)vegetarianButtonTapped:(UISwitch *)sender {
    if (sender.on == NO) {
        sender.on = YES;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:sender.on forKey:@"vegetarianButtonStatus"];
    }
    else {
        sender.on = NO;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:sender.on forKey:@"vegetarianButtonStatus"];
    }
}


- (IBAction)lactoButtonTapped:(UISwitch *)sender {
    if (sender.on == NO) {
        sender.on = YES;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:sender.on forKey:@"lactoButtonStatus"];
    }
    else {
        sender.on = NO;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:sender.on forKey:@"lactoButtonStatus"];
    }
}

- (IBAction)veganButtonTapped:(UISwitch *)sender {
    if (sender.on == NO) {
        sender.on = YES;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:sender.on forKey:@"veganButtonStatus"];
    }
    else {
        sender.on = NO;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:sender.on forKey:@"veganButtonStatus"];
    }
}

- (IBAction)pescetarianButtonTapped:(UISwitch *)sender {
    if (sender.on == NO) {
        sender.on = YES;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:sender.on forKey:@"pescatarianButtonStatus"];
    }
    else {
        sender.on = NO;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:sender.on forKey:@"pescatarianButtonStatus"];
    }
}


- (IBAction)backButtonPressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
