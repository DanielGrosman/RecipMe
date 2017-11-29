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

@interface RecipeListViewController () <UITableViewDataSource, UITableViewDelegate, FetchDataDelegate>

@property (nonatomic,strong) NSString *searchItem;
@property (nonatomic,strong) NSArray<Recipe*>* recipes;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RecipeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"showRecipesList"]){
        SearchViewController *controller = (SearchViewController *)[segue destinationViewController];
        controller.delegate = self;
    }
}

-(void)fetchData:(NSString *)searchString {
    self.searchItem = searchString;
    [YummlyAPI searchFor:searchString complete:^(NSArray *results) {
        self.recipes = results;
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
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
    
    cell.savedRecipeName.text = currentRecipe.recipeName;
    NSLog(@"%@",cell.savedRecipeName.text);
    NSURL *smallImageURL = [NSURL URLWithString:currentRecipe.smallPictureURL];
    NSData *smallImageData = [NSData dataWithContentsOfURL:smallImageURL];
    UIImage *smallImage = [UIImage imageWithData:smallImageData];
    cell.backgroundColor = [UIColor blueColor];
    cell.savedRecipeImageView.image = smallImage;
    cell.savedRecipeRating.text = [NSString stringWithFormat:@"%f",currentRecipe.rating];
    cell.savedRecipeTime.text =  [NSString stringWithFormat:@"%d",currentRecipe.totalTime];
    
    return cell;
    
}



@end
