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
#import <XLPagerTabStrip/XLPagerTabStripViewController.h>

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
//    self.view.frame.origin.y = 20;
    
    
    CGRect newBounds = CGRectMake(self.view.bounds.origin.x, -44, self.view.bounds.size.width, self.view.bounds.size.height);
    self.view.bounds= newBounds;
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
        if ([defaults boolForKey:@"dairyButtonStatus"]) {
            [self.filterString appendString:@"&allowedAllergy[]=396%5eDairy-Free"];
        }
        if ([defaults boolForKey:@"veganButtonStatus"]) {
            [self.filterString appendString:@"&allowedDiet[]=386%5eVegan"];
        }
        if ([defaults boolForKey:@"glutenButtonStatus"]) {
            [self.filterString appendString:@"&allowedAllergy[]=393%5eGluten-Free"];
        }
        
        RecipeListViewController *controller = (RecipeListViewController *)[segue destinationViewController];
        NSArray *stringsEnteredArray = [self.searchBar.text componentsSeparatedByString:@" "];
        NSString *recipesEntered = [stringsEnteredArray componentsJoinedByString:@"+"];
        [controller setFilterString:self.filterString];
        [controller setRecipeForIngredient: recipesEntered];
    }
}

- (NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController{
    return @"Ingredients Search";
}

@end
