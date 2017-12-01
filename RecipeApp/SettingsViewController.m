//
//  SettingsViewController.m
//  RecipeApp
//
//  Created by Daniel Grosman on 2017-11-29.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *topImage;

@property (strong, nonatomic) NSMutableString *mutableURLString;
@property (weak, nonatomic) IBOutlet UISwitch *vegetarianSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *dairySwitch;
@property (weak, nonatomic) IBOutlet UISwitch *veganSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *glutenSwitch;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.vegetarianSwitch.on = [defaults boolForKey:@"vegetarianButtonStatus"];
    self.dairySwitch.on = [defaults boolForKey:@"dairyButtonStatus"];
    self.veganSwitch.on = [defaults boolForKey:@"veganButtonStatus"];
    self.glutenSwitch.on = [defaults boolForKey:@"glutenButtonStatus"];
    self.mutableURLString = [[NSMutableString alloc] init];

    self.topImage.contentMode = UIViewContentModeScaleAspectFill;
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

- (IBAction)dairyButtonTapped:(UISwitch *)sender {
    if (sender.on == NO) {
        sender.on = YES;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:sender.on forKey:@"dairyButtonStatus"];
    }
    else {
        sender.on = NO;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:sender.on forKey:@"dairyButtonStatus"];
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

- (IBAction)glutenButtonTapped:(UISwitch *)sender {
    if (sender.on == NO) {
        sender.on = YES;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:sender.on forKey:@"glutenButtonStatus"];
    }
    else {
        sender.on = NO;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:sender.on forKey:@"glutenButtonStatus"];
    }
    
}


- (IBAction)backButtonPressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
