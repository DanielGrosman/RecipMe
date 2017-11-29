//
//  RecipeListViewController.m
//  RecipeApp
//
//  Created by Javier Xing on 2017-11-28.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "RecipeListViewController.h"
#import "RecipeTableViewCell.h"
#import "Recipe+customInitializer.h"
#import "YummlyAPI.h"
#import "SearchViewController.h"
#import "Recipe+CoreDataProperties.h"

@interface RecipeListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) NSArray<Recipe*>* recipes;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RecipeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchData:self.recipeForIngredient];
}

-(void)fetchData:(NSString *)searchString {
    [YummlyAPI searchFor:searchString complete:^(NSArray *results) {
//        self.recipes = results;
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.recipes = results;
            [self.tableView reloadData];
        }];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.recipes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RecipeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchResultCell" forIndexPath:indexPath];
    
    Recipe *currentRecipe = self.recipes[indexPath.row];
    
    cell.searchRecipeName.text = currentRecipe.recipeName;

    NSURL *smallImageURL = [NSURL URLWithString:currentRecipe.smallPictureURL];
    NSData *smallImageData = [NSData dataWithContentsOfURL:smallImageURL];
    UIImage *smallImage = [UIImage imageWithData:smallImageData];
    cell.searchRecipeImageView.image = smallImage;

    cell.searchRecipeRating.text = [NSString stringWithFormat:@"Rating: %2.0f",currentRecipe.rating];

    if ([currentRecipe.totalTime isEqualToString:@"<null>"]) {
        cell.searchRecipeTime.text = @"";
    }
    else{
        int timeinSeconds = [currentRecipe.totalTime intValue];
        int timeInMinutes = timeinSeconds/60;
        NSString *timeString = [NSString stringWithFormat:@"%d",timeInMinutes];
        cell.searchRecipeTime.text =  [NSString stringWithFormat:@"%@ Minutes",timeString];
    }
    
    return cell;
    
}



@end
