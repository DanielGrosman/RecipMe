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

@interface SearchViewController ()
//@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIImageView *searchImage;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.searchBar.delegate = self;
    self.searchImage.image = [UIImage imageNamed:@"search"];
    
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    searchController.searchResultsController.view.hidden = NO;
    //    NSString *searchText = searchController.searchBar.text;
    //    NSPredicate *predicate = [NSPredicate predicateWithFormat:@“SELF contains[cd] %@“, searchText];
    //    self.filteredData = [self.data filteredArrayUsingPredicate:predicate];
//    [self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self performSegueWithIdentifier:@"showRecipesList" sender:self];
    
//    [self.storyboard instantiateViewControllerWithIdentifier:@"recipeResultsViewController"];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"showRecipesList"]){
        RecipeListViewController *controller = (RecipeListViewController *)[segue destinationViewController];
        [controller setRecipeForIngredient:self.searchBar.text];
    }
}





@end
