//
//  SearchViewController.m
//  RecipeApp
//
//  Created by Javier Xing on 2017-11-27.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "SearchViewController.h"
#import "RecipeResultsViewController.h"

@interface SearchViewController () 

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonTapped:(UIButton *)sender {
//        [self performSegueWithIdentifier:@"showRecipes" sender:self];
//     RecipeResultsViewController *rrvc = [self.storyboard instantiateViewControllerWithIdentifier:@"recipeResultsViewController"];
//    [self.navigationController pushViewController:rrvc animated:YES];
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    searchController.searchResultsController.view.hidden = NO;
    //    NSString *searchText = searchController.searchBar.text;
    //    NSPredicate *predicate = [NSPredicate predicateWithFormat:@“SELF contains[cd] %@“, searchText];
    //    self.filteredData = [self.data filteredArrayUsingPredicate:predicate];
//    [self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{

}



@end
