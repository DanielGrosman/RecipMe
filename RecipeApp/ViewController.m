//
//  ViewController.m
//  RecipeApp
//
//  Created by Daniel Grosman on 2017-11-27.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "ViewController.h"
#import "SearchViewController.h"
#import "RecipeTableViewCell.h"
#import "YummlyAPI.h"

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
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RecipeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"savedRecipeCell" forIndexPath:indexPath];
    
    cell.savedRecipeName.text = @"TEST";
    
    return cell;

}


@end
