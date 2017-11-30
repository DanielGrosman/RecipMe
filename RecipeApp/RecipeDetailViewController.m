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
    cell.textLabel.text = self.ingredientsArray[indexPath.row];
    
    
    return cell;
}




@end
