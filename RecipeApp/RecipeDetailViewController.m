//
//  RecipeDetailViewController.m
//  RecipeApp
//
//  Created by Javier Xing on 2017-11-28.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "RecipeDetailViewController.h"

@interface RecipeDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *savedDetailImageView;
@property (weak, nonatomic) IBOutlet UILabel *savedDetailName;
@property (weak, nonatomic) IBOutlet UILabel *savedDetailIngredients;
@property (weak, nonatomic) IBOutlet UILabel *savedDetailCalories;
@property (weak, nonatomic) IBOutlet UILabel *savedDetailFat;
@property (weak, nonatomic) IBOutlet UILabel *savedDetailProtein;
@property (weak, nonatomic) IBOutlet UILabel *savedDetailSugar;
@property (weak, nonatomic) IBOutlet UILabel *savedDetailCarbs;

@end

@implementation RecipeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.savedDetailIngredients.text = @"turkey,butter,salt,pepper,rosemary,thyme,onions,garlic";
}


@end
