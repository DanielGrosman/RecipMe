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
#import "SettingsViewController.h"

@interface SearchViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIImageView *searchImage;
@property (nonatomic, strong) SettingsViewController *settingsViewController;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    self.searchImage.image = [UIImage imageNamed:@"search"];
}
- (IBAction)screenTapped:(UITapGestureRecognizer *)sender {
    [self.searchBar resignFirstResponder];
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    searchController.searchResultsController.view.hidden = NO;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self performSegueWithIdentifier:@"showRecipesList" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"showRecipesList"]){
        
        self.filterString = [[NSMutableString alloc] init];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        if ([defaults boolForKey:@"vegetarianButtonStatus"]) {
            [self.filterString appendString:@"&allowedDiet[]=387%5eLacto-ovo%20vegetarian"];
        }
        if ([defaults boolForKey:@"lactoButtonStatus"]) {
            [self.filterString appendString:@"&allowedDiet[]=388%5eLacto%20vegetarian"];
        }
        if ([defaults boolForKey:@"veganButtonStatus"]) {
            [self.filterString appendString:@"&allowedDiet[]=386%5eVegan"];
        }
        if ([defaults boolForKey:@"pescatarianButtonStatus"]) {
            [self.filterString appendString:@"&allowedDiet[]=390%5ePescetarian"];
        }
        
        RecipeListViewController *controller = (RecipeListViewController *)[segue destinationViewController];
        NSArray *stringsEnteredArray = [self.searchBar.text componentsSeparatedByString:@" "];
        NSString *recipesEntered = [stringsEnteredArray componentsJoinedByString:@"+"];
        [controller setFilterString:self.filterString];
        [controller setRecipeForIngredient: recipesEntered];
    }
}

@end
