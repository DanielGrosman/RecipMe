//
//  ButtonBarTabViewController.m
//  RecipeApp
//
//  Created by Javier Xing on 2017-11-29.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "ButtonBarTabViewController.h"
#import "ViewController.h"
#import "SearchViewController.h"

@interface ButtonBarTabViewController ()

@end

@implementation ButtonBarTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.buttonBarView.backgroundColor = [UIColor orangeColor];
}


-(NSArray *)childViewControllersForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController{
    
    ViewController *savedRecipesVC = [self.storyboard instantiateViewControllerWithIdentifier:@"savedRecipesList"];
    
    SearchViewController *searchVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ingredientSearchVC"];
    
    [self.buttonBarView registerNib:[UINib nibWithNibName:@"ButtonCell" bundle:[NSBundle bundleForClass:[self class]]]  forCellWithReuseIdentifier:@"Cell"];
    
    return @[savedRecipesVC, searchVC];
}

@end
