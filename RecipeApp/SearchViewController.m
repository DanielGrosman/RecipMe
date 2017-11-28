//
//  SearchViewController.m
//  RecipeApp
//
//  Created by Javier Xing on 2017-11-27.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "SearchViewController.h"
#import "RecipeListViewController.h"
#import "RecipeTableViewCell.h"

@interface SearchViewController () <UITableViewDelegate, UITableViewDataSource>
//@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.searchBar.delegate = self;
    
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    searchController.searchResultsController.view.hidden = NO;
    //    NSString *searchText = searchController.searchBar.text;
    //    NSPredicate *predicate = [NSPredicate predicateWithFormat:@“SELF contains[cd] %@“, searchText];
    //    self.filteredData = [self.data filteredArrayUsingPredicate:predicate];
//    [self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self performSegueWithIdentifier:@"showRecipesList" sender:self];
    [self.storyboard instantiateViewControllerWithIdentifier:@"recipeResultsViewController"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RecipeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"recipeCell" forIndexPath:indexPath];
    
    return cell;
    
}






@end
