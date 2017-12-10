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
#import <ChameleonFramework/Chameleon.h>

@interface ButtonBarTabViewController ()

@end

@implementation ButtonBarTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.buttonBarView.selectedBar.backgroundColor = [UIColor flatSkyBlueColorDark];
//    [self.buttonBarView.selectedBar centerXAnchor];
    self.buttonBarView.backgroundColor = [UIColor  flatWhiteColor];
    
    self.changeCurrentIndexBlock = (^void(XLButtonBarViewCell* oldCell, XLButtonBarViewCell *newCell, BOOL animated){
        
        oldCell.label.textColor =[UIColor flatBlackColor];
        oldCell.label.font = [UIFont fontWithName:@"Helvetica" size:15];
        
        newCell.label.textColor =[UIColor flatSkyBlueColorDark];
        newCell.label.font = [UIFont fontWithName:@"Helvetica" size:15];
    });

}


-(NSArray *)childViewControllersForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController{
    
    ViewController *savedRecipesVC = [self.storyboard instantiateViewControllerWithIdentifier:@"savedRecipesList"];
    
    SearchViewController *searchVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ingredientSearchVC"];
    
    [self.buttonBarView registerNib:[UINib nibWithNibName:@"ButtonCell" bundle:[NSBundle bundleForClass:[self class]]]  forCellWithReuseIdentifier:@"Cell"];
    
    return @[savedRecipesVC, searchVC];
}

@end
