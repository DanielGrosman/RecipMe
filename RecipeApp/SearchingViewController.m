//
//  SearchingViewController.m
//  RecipeApp
//
//  Created by Javier Xing on 2017-11-27.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "SearchingViewController.h"

@interface SearchingViewController ()

@end

@implementation SearchingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    searchController.searchResultsController.view.hidden = NO;
    //    NSString *searchText = searchController.searchBar.text;
    //    NSPredicate *predicate = [NSPredicate predicateWithFormat:@“SELF contains[cd] %@“, searchText];
    //    self.filteredData = [self.data filteredArrayUsingPredicate:predicate];
    //    [self.tableView reloadData];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
