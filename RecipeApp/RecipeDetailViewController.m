//
//  RecipeDetailViewController.m
//  RecipeApp
//
//  Created by Javier Xing on 2017-11-28.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "RecipeDetailViewController.h"

@interface RecipeDetailViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *savedDetailImageView;
@property (weak, nonatomic) IBOutlet UILabel *savedDetailName;
@property (weak, nonatomic) IBOutlet UILabel *savedDetailIngredients;
@property (weak, nonatomic) IBOutlet UILabel *savedDetailCalories;
@property (weak, nonatomic) IBOutlet UILabel *savedDetailFat;
@property (weak, nonatomic) IBOutlet UILabel *savedDetailProtein;
@property (weak, nonatomic) IBOutlet UILabel *savedDetailSugar;
@property (weak, nonatomic) IBOutlet UILabel *savedDetailCarbs;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *labelBackgroundView;

@end

@implementation RecipeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.labelBackgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
    [self setupRecipeView];
}

-(void)setupRecipeView{
    self.savedDetailName.text = self.recipe.recipeName;
//    self.savedDetailIngredients.text = self.recipe.ingredients;
    self.ingredientsArray = [self.recipe.ingredients componentsSeparatedByString:@", "];
    
    NSString *caloriesString = [NSString stringWithFormat:@"%2.0f", self.recipe.calories];
    if (![caloriesString  isEqual: @"nan"]) {
        self.savedDetailCalories.text = caloriesString;
    } else {
        self.savedDetailCalories.text = @"N/A";
    }
    NSString *proteinString = [NSString stringWithFormat:@"%2.0f", self.recipe.protein];
    if (![proteinString  isEqual: @"nan"]) {
        self.savedDetailProtein.text = proteinString;
    } else {
        self.savedDetailProtein.text = @"N/A";
    }
    NSString *sugarString = [NSString stringWithFormat:@"%2.0f", self.recipe.sugar];
    if (![sugarString  isEqual: @"nan"]) {
        self.savedDetailSugar.text = sugarString;
    } else {
        self.savedDetailSugar.text = @"N/A";
    }
    NSString *fatString = [NSString stringWithFormat:@"%2.0f", self.recipe.fat];
    if (![fatString  isEqual: @"nan"]) {
        self.savedDetailFat.text = fatString;
    } else {
        self.savedDetailFat.text = @"N/A";
    }
    NSString *carbsString = [NSString stringWithFormat:@"%2.0f", self.recipe.carbohydrate];
    if (![carbsString  isEqual: @"nan"]) {
        self.savedDetailCarbs.text = carbsString;
    } else {
        self.savedDetailCarbs.text = @"N/A";
    }
    NSArray *docDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *imageFilePath = [docDirectory firstObject];
    imageFilePath = [imageFilePath stringByAppendingPathComponent:self.recipe.largeImagePath];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:imageFilePath]) {
        NSData *imageData = [NSData dataWithContentsOfFile:imageFilePath];
        UIImage *largeImage = [UIImage imageWithData:imageData];
        self.savedDetailImageView.image = largeImage;
        self.savedDetailImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self.tableView reloadData];
    }];
    
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.ingredientsArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSString *capitalizedString = self.ingredientsArray[indexPath.row];
    capitalizedString = [NSString stringWithFormat:@"%@%@",[[capitalizedString substringToIndex:1] uppercaseString],[capitalizedString substringFromIndex:1]];
    cell.textLabel.text = capitalizedString;
    
    
    return cell;
}

-(IBAction)openRecipeLink:(UIButton*)sender{
    NSURL *recipeURL = [NSURL URLWithString:self.recipe.recipeURL];
    if ([[UIApplication sharedApplication] canOpenURL:recipeURL]) {
        [[UIApplication sharedApplication]openURL:recipeURL options:@{} completionHandler:nil];
    }
}





@end
