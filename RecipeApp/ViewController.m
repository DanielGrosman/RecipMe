//
//  ViewController.m
//  RecipeApp
//
//  Created by Daniel Grosman on 2017-11-27.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "ViewController.h"
#import "RecipeTableViewCell.h"
#import "YummlyAPI.h"
#import "Recipe+customInitializer.h"
#import "AppDelegate.h"
#import "SavedRecipesTableViewCell.h"
#import "RecipeDetailViewController.h"
#import <XLPagerTabStrip/XLPagerTabStripViewController.h>

@interface ViewController () <UITableViewDelegate, UITableViewDataSource,XLPagerTabStripChildItem>
//@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)NSArray <Recipe*> *savedRecipies;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.editButton.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.75f];
    
    self.tableView.contentInset = UIEdgeInsetsMake(44, 0, 0, 0);
//    [self.tableView setContentOffset:CGPointMake(0, 44)];
    
    [self fetchRecipesData];
    NSLog(@"%@", @(self.tableView.contentInset.top));
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fetchRecipesData) name:NSManagedObjectContextDidSaveNotification object:nil];
}

- (void)viewDidLayoutSubviews {
    NSLog(@"%@", NSStringFromCGPoint(self.tableView.contentOffset));

}

-(void)fetchRecipesData{
    AppDelegate *appDelegate = ((AppDelegate*)[[UIApplication sharedApplication] delegate]);
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Recipe"];
//    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"tagName" ascending:YES];
    self.savedRecipies = [appDelegate.persistentContainer.viewContext executeFetchRequest:request error:nil];
}

-(void)setSavedRecipies:(NSArray<Recipe *> *)savedRecipies{
    _savedRecipies = savedRecipies;
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.savedRecipies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SavedRecipesTableViewCell *cell = (SavedRecipesTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"savedRecipeCell" forIndexPath:indexPath];
    
    Recipe *currentRecipe = self.savedRecipies[indexPath.row];
    
    cell.savedRecipeName.text = currentRecipe.recipeName;
    
//    NSURL *smallImageURL = [NSURL URLWithString:currentRecipe.smallPictureURL];
//    NSData *smallImageData = [NSData dataWithContentsOfURL:smallImageURL];
//    UIImage *smallImage = [UIImage imageWithData:smallImageData];
//    cell.savedRecipeImageView.image = smallImage;
    NSArray *docDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *imageFilePath = [docDirectory firstObject];
    imageFilePath = [imageFilePath stringByAppendingString:currentRecipe.largeImagePath];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:imageFilePath]) {
        NSData *imageData = [NSData dataWithContentsOfFile:imageFilePath];
        UIImage *smallImage = [UIImage imageWithData:imageData];
        cell.savedRecipeImageView.image = smallImage;
        cell.savedRecipeImageView.contentMode = UIViewContentModeScaleAspectFill;
    }

    cell.savedRecipeRating.text = [NSString stringWithFormat:@"Rating: %2.0f",currentRecipe.rating];
    
    if ([currentRecipe.totalTime isEqualToString:@"<null>"]) {
        cell.savedRecipeTime.text = @"";
    }
    else{
        int timeinSeconds = [currentRecipe.totalTime intValue];
        int timeInMinutes = timeinSeconds/60;
        NSString *timeString = [NSString stringWithFormat:@"%d",timeInMinutes];
        cell.savedRecipeTime.text =  [NSString stringWithFormat:@"%@ Minutes",timeString];
    }
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"savedRecipeDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Recipe *recipe = self.savedRecipies[indexPath.row];
        
        RecipeDetailViewController *controller = [segue destinationViewController];
        [controller setRecipe:recipe];
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController{
    return @"Saved Recipes";
}


@end
