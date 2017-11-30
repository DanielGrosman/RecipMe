//
//  RecipeListViewController.m
//  RecipeApp
//
//  Created by Javier Xing on 2017-11-28.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "RecipeListViewController.h"
#import "RecipeViewController.h"
#import "RecipeTableViewCell.h"
#import "Recipe+customInitializer.h"
#import "YummlyAPI.h"
#import "SearchViewController.h"
#import "Recipe+CoreDataProperties.h"
#import "SearchResultRecipe.h"
#import "MBProgressHUD.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface RecipeListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) NSArray<SearchResultRecipe*>* recipes;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) MBProgressHUD *hud;

@end

@implementation RecipeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchData:self.recipeForIngredient];
    [self setupHUD];
}

-(void) setupHUD {
    self.hud = [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    self.hud.mode = MBProgressHUDModeIndeterminate;
    self.hud.contentColor= [UIColor blackColor];
    self.hud.label.text = @"Loading";
}

-(void) hideHUD {
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        // Do something...
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.tableView animated:YES];
        });
    });
}

-(void)fetchData:(NSString *)searchString {
    NSString *newSearchString = [searchString stringByAppendingString:self.filterString];
    
    [YummlyAPI searchFor:newSearchString complete:^(NSArray *results) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self hideHUD];
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
    
    SearchResultRecipe *currentRecipe = self.recipes[indexPath.row];
    
    cell.searchRecipeName.text = currentRecipe.recipeName;
    
    [cell.searchRecipeImageView sd_setImageWithURL:[NSURL URLWithString:currentRecipe.smallPictureURL]
                 placeholderImage:nil];
    
    
    
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"presentRecipe"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        SearchResultRecipe *recipe = self.recipes[indexPath.row];
        UINavigationController *navController = [segue destinationViewController];
        RecipeViewController *detailVC = (RecipeViewController*)[navController viewControllers].firstObject;
        
        [YummlyAPI getRecipeDetailsFor:recipe complete:^(SearchResultRecipe*recipe) {
            [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                [detailVC setSelectedRecipe:recipe];
                [detailVC setupRecipe];
            }];
        }];
        
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    
}



@end
