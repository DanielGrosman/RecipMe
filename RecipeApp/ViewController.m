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
#import <CoreData/CoreData.h>

@interface ViewController () <UITableViewDelegate, UITableViewDataSource,XLPagerTabStripChildItem,NSFetchedResultsControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)NSArray <Recipe*> *savedRecipies;
@property (strong, nonatomic)NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(44, 0, 0, 0);
    [self fetchRecipesData];
    self.editButton.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.75f];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fetchRecipesData) name:NSManagedObjectContextDidSaveNotification object:nil];
}

#pragma mark - Setup View

-(void)fetchRecipesData{
    AppDelegate *appDelegate = ((AppDelegate*)[[UIApplication sharedApplication] delegate]);
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Recipe"];
//    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"tagName" ascending:YES];
    self.managedObjectContext = appDelegate.persistentContainer.viewContext;
    self.savedRecipies = [appDelegate.persistentContainer.viewContext executeFetchRequest:request error:nil];
}

-(void)setSavedRecipies:(NSArray<Recipe *> *)savedRecipies{
    _savedRecipies = savedRecipies;
    [self.tableView reloadData];
}

#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.savedRecipies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SavedRecipesTableViewCell *cell = (SavedRecipesTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"savedRecipeCell" forIndexPath:indexPath];
    
    Recipe *currentRecipe = self.savedRecipies[indexPath.row];
    
    cell.savedRecipeName.text = currentRecipe.recipeName;

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

#pragma mark - Editing TableView

- (IBAction)edit:(id)sender {
    if (self.tableView.isEditing ) {
        [self.tableView setEditing:NO animated:YES];
    }
    else{
    [self.tableView setEditing:YES animated:YES];
    }
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return  YES;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        [context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
        
        NSError *error = nil;
        if (![context save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }

    }
}

#pragma mark - FetchResultsController

-(NSFetchedResultsController *)fetchedResultsController{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    NSFetchRequest *fetchRequest = [Recipe fetchRequest];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"rating" ascending:YES];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    self.fetchedResultsController.delegate = self;
    
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    return _fetchedResultsController;
}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"savedRecipeDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Recipe *recipe = self.savedRecipies[indexPath.row];
        
        RecipeDetailViewController *controller = [segue destinationViewController];
        [controller setRecipe:recipe];
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

#pragma mark -Custom TabBar 

- (NSString *)titleForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController{
    return @"Saved Recipes";
}


@end
