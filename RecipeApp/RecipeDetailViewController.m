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
    [self setupRecipeView];
}

-(void)setupRecipeView{
    self.savedDetailName.text = self.recipe.recipeName;
    self.savedDetailIngredients.text = self.recipe.ingredients;
    self.savedDetailCalories.text = [NSString stringWithFormat:@"%2.0f", self.recipe.calories];
    self.savedDetailProtein.text = [NSString stringWithFormat:@"%2.0f", self.recipe.protein];
    self.savedDetailSugar.text = [NSString stringWithFormat:@"%2.0f", self.recipe.sugar];
    self.savedDetailFat.text = [NSString stringWithFormat:@"%2.0f", self.recipe.fat];
    self.savedDetailCarbs.text = [NSString stringWithFormat:@"%2.0f", self.recipe.carbohydrate];
//    NSLog(@"%@",self.recipe.largeImagePath);
    NSArray *docDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *imageFilePath = [docDirectory firstObject];
    imageFilePath = [imageFilePath stringByAppendingString:self.recipe.largeImagePath];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:imageFilePath]) {
        NSData *imageData = [NSData dataWithContentsOfFile:imageFilePath];
        UIImage *largeImage = [UIImage imageWithData:imageData];
        self.savedDetailImageView.image = largeImage;
    }
    
}


@end
