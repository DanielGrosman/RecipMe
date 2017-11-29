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

- (IBAction)cancelButtonTapped:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.recipeDetailName.text = self.selectedRecipe.recipeName;
    self.recipeDetailIngredients.text = self.selectedRecipe.ingredients;
    NSLog(@"%@", self.selectedRecipe.largePictureURL);
    [self setupRecipe];
//    NSLog(@"%@", self.selectedRecipe);
}

-(void)setupRecipe{
    NSURL *largeImageURL = [NSURL URLWithString:self.selectedRecipe.largePictureURL];
//    NSData *largeImageData = [NSData dataWithContentsOfURL:largeImageURL];
//    UIImage *largeImage = [UIImage imageWithData:largeImageData];
//    self.recipeDetailImageView.image = largeImage;
    NSLog(@"%@", largeImageURL);
    NSLog(@"%@", self.selectedRecipe.largePictureURL);
    NSURLSessionTask *imageTask = [[NSURLSession sharedSession] dataTaskWithURL:largeImageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        UIImage *largeImage = [UIImage imageWithData:data];

        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.recipeDetailImageView.image = largeImage;
        }];
    }];
    [imageTask resume];
}

@end
