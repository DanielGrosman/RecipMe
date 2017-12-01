//
//  RecipeViewController.m
//  RecipeApp
//
//  Created by Javier Xing on 2017-11-28.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "RecipeViewController.h"
#import "AppDelegate.h"




@interface RecipeViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *recipeDetailImageView;
@property (weak, nonatomic) IBOutlet UILabel *recipeDetailName;
@property (weak, nonatomic) IBOutlet UILabel *recipeDetailIngredients;
@property (weak, nonatomic) IBOutlet UILabel *recipeDetailCalories;
@property (weak, nonatomic) IBOutlet UILabel *recipeDetailFat;
@property (weak, nonatomic) IBOutlet UILabel *recipeDetailProtein;
@property (weak, nonatomic) IBOutlet UILabel *recipeDetailSugar;
@property (weak, nonatomic) IBOutlet UILabel *recipeDetailCarbs;
@property (weak, nonatomic) IBOutlet UIView *nameBackground;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation RecipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.nameBackground.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
}

-(void)setupRecipe{
    self.recipeDetailName.text = self.selectedRecipe.recipeName;
//    self.recipeDetailIngredients.text = self.selectedRecipe.ingredients;
    self.ingredientsArray = [self.selectedRecipe.ingredients componentsSeparatedByString:@", "];
    self.recipeDetailCalories.text = [NSString stringWithFormat:@"%2.0f",self.selectedRecipe.calories];
    self.recipeDetailProtein.text = [NSString stringWithFormat:@"%2.0f",self.selectedRecipe.protein];
    self.recipeDetailSugar.text = [NSString stringWithFormat:@"%2.0f",self.selectedRecipe.sugar];
    self.recipeDetailFat.text = [NSString stringWithFormat:@"%2.0f",self.selectedRecipe.fat];
    self.recipeDetailCarbs.text = [NSString stringWithFormat:@"%2.0f",self.selectedRecipe.carbs];
    NSURL *largeImageURL = [NSURL URLWithString:self.selectedRecipe.largePictureURL];
    NSURLSessionTask *imageTask = [[NSURLSession sharedSession] dataTaskWithURL:largeImageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        UIImage *largeImage = [UIImage imageWithData:data];

        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.recipeDetailImageView.image = largeImage;
            self.recipeDetailImageView.contentMode = UIViewContentModeScaleAspectFill;
            [self.tableView reloadData];
        }];
    }];
    [imageTask resume];
    
}


- (IBAction)cancelButtonTapped:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)saveButtonTapped:(id)sender {
    [self saveRecipe];
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)saveRecipe{
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    Recipe *recipe = [[Recipe alloc]initWithContext:appDelegate.persistentContainer.viewContext];
    
    recipe.recipeName = self.selectedRecipe.recipeName;
    recipe.recipeID = self.selectedRecipe.recipeID;
    recipe.totalTime = self.selectedRecipe.totalTime;
    
    recipe.smallPictureURL = self.selectedRecipe.smallPictureURL;
    
    recipe.ingredients = self.selectedRecipe.ingredients;
    recipe.recipeURL = self.selectedRecipe.recipeURL;
    recipe.rating = self.selectedRecipe.rating;
    recipe.protein = self.selectedRecipe.protein;
    recipe.calories = self.selectedRecipe.calories;
    recipe.sugar = self.selectedRecipe.sugar;
    recipe.fat = self.selectedRecipe.fat;
    recipe.carbohydrate = self.selectedRecipe.carbs;
    [self saveImage:recipe];
    
    [appDelegate.persistentContainer.viewContext insertObject:recipe];
    [appDelegate saveContext];
}

-(void)saveImage:(Recipe *)recipe{
//    Large Image Save
    NSArray *docDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docFilePath = [docDirectory firstObject];
    recipe.largeImagePath = [[NSUUID UUID].UUIDString stringByAppendingPathExtension:@"jpg"];
    NSString *largeDocFilePath = [docFilePath stringByAppendingString:recipe.largeImagePath];
    NSData *largeImageData = UIImageJPEGRepresentation(self.recipeDetailImageView.image , 1.0);
//    [largeImageData writeToFile:largeDocFilePath atomically:YES];
    NSError *err =nil;
    [largeImageData writeToFile:largeDocFilePath options:NSDataWritingAtomic error:&err];
    if (err != nil) {
        NSLog(@"%@", err);
    }
//    Small Image Save
    recipe.smallImagePath =[[NSUUID UUID].UUIDString stringByAppendingString:@"jpg"];
    NSString *smallDocFilePath = [docFilePath stringByAppendingString:recipe.smallImagePath];
    NSData *smallImageData = [NSData dataWithContentsOfURL: [NSURL URLWithString:recipe.smallPictureURL]];
    [smallImageData writeToFile:smallDocFilePath atomically:YES];
    
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
    NSURL *recipeURL = [NSURL URLWithString:self.selectedRecipe.recipeURL];
    if ([[UIApplication sharedApplication] canOpenURL:recipeURL]) {
        [[UIApplication sharedApplication]openURL:recipeURL options:@{} completionHandler:nil];
    }
}



@end
