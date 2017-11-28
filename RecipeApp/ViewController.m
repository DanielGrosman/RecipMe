//
//  ViewController.m
//  RecipeApp
//
//  Created by Daniel Grosman on 2017-11-27.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "ViewController.h"
#import "SearchViewController.h"
#import "SearchingViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate>
//@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)UISearchController *searchController;
@property (nonatomic, strong) SearchViewController *searchViewController;
@property (nonatomic,strong) UINavigationController *navController;
@property (nonatomic, strong)UISearchContainerViewController *searchContainer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupSearchController];
}

- (void)setupSearchController {
    
//    SearchViewController *searchViewController = (SearchViewController *) navController.topViewController;
      self.navController  = [self.storyboard instantiateViewControllerWithIdentifier:@"NavViewController"];
    self.searchViewController = [self.navController viewControllers][0];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:self.searchViewController];
    
    self.searchContainer = [[SearchingViewController alloc]initWithSearchController:self.searchController];
    
//    self.searchController.searchResultsUpdater = self.searchViewController;
    self.searchController.searchResultsUpdater = self.searchContainer;
//    self.searchController.hidesNavigationBarDuringPresentation = NO;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.searchBar.delegate = self.searchViewController;
    self.definesPresentationContext = YES;
    
    // adds search bar to tableView header area
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;

}


@end
