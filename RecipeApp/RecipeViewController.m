//
//  RecipeViewController.m
//  RecipeApp
//
//  Created by Javier Xing on 2017-11-28.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "RecipeViewController.h"



@interface RecipeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *recipeDetailImageView;
@property (weak, nonatomic) IBOutlet UILabel *recipeDetailName;
@property (weak, nonatomic) IBOutlet UILabel *recipeDetailIngredients;
@property (weak, nonatomic) IBOutlet UILabel *recipeDetailCalories;
@property (weak, nonatomic) IBOutlet UILabel *recipeDetailFat;
@property (weak, nonatomic) IBOutlet UILabel *recipeDetailProtein;
@property (weak, nonatomic) IBOutlet UILabel *recipeDetailSugar;
@property (weak, nonatomic) IBOutlet UILabel *recipeDetailCarbs;

@end

@implementation RecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
