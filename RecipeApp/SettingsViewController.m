//
//  SettingsViewController.m
//  RecipeApp
//
//  Created by Daniel Grosman on 2017-11-29.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (strong, nonatomic) NSMutableString *mutableURLString;
@property (weak, nonatomic) IBOutlet UISwitch *vegetarianSwitch;




@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    self.vegetarianSwitch.on = [defaults floatForKey:@"vegetarianButtonStatus"];
    self.mutableURLString = [[NSMutableString alloc] init];
}

- (IBAction)vegetarianButtonTapped:(UISwitch *)sender {
    if (sender.on == NO) {
        sender.on = YES;
    }
}
//        if (![self.mutableURLString containsString:@"&allowedDiet[]=387^Lacto-ovo vegetarian"]){
//            [self.mutableURLString appendString:@"&allowedDiet[]=387^Lacto-ovo vegetarian"];
//            NSLog(@"%@",self.mutableURLString);
//        }
//    }
//    else {
//        sender.on = NO;
//    }
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setBool:sender.on forKey:@"vegetarianButtonStatus"];
//}

- (IBAction)lactoButtonTapped:(UISwitch *)sender {
    if (sender.isOn) {
        if (![self.mutableURLString containsString:@"&allowedDiet[]=388^Lacto vegetarian"]){
            [self.mutableURLString appendString:@"&allowedDiet[]=388^Lacto vegetarian"];
            NSLog(@"%@",self.mutableURLString);
        }
    }
}

- (IBAction)veganButtonTapped:(UISwitch *)sender {
    if (sender.isOn) {
        if (![self.mutableURLString containsString:@"&allowedDiet[]=386^Vegan"]){
            [self.mutableURLString appendString:@"&allowedDiet[]=386^Vegan"];
            NSLog(@"%@",self.mutableURLString);
        }
    }
}

- (IBAction)pescetarianButtonTapped:(UISwitch *)sender {
    if (sender.isOn) {
        if (![self.mutableURLString containsString:@"&allowedDiet[]=390^Pescetarian"]){
            [self.mutableURLString appendString:@"&allowedDiet[]=390^Pescetarian"];
            NSLog(@"%@",self.mutableURLString);
        }
    }
}

- (IBAction)backButtonPressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
