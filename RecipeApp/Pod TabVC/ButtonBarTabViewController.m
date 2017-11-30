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
    self.buttonBarView.backgroundColor = [UIColor whiteColor];
    
    //    self.navigationController.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSArray *)childViewControllersForPagerTabStripViewController:(XLPagerTabStripViewController *)pagerTabStripViewController{

    ViewController *savedRecipesVC = [self.storyboard instantiateViewControllerWithIdentifier:@"savedRecipesList"];
//    CGRect frame = savedRecipesVC.view.frame;
//    frame.origin.y = 20;
//    CGPoint offset = CGPointMake(0, 20);
//    savedRecipesVC.view.frame = CGRectMake(offset.x, offset.y, savedRecipesVC.view.frame.size.width, savedRecipesVC.view.frame.size.height);

    SearchViewController *searchVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ingredientSearchVC"];
    
    [self.buttonBarView registerNib:[UINib nibWithNibName:@"ButtonCell" bundle:[NSBundle bundleForClass:[self class]]]  forCellWithReuseIdentifier:@"Cell"];
    
    
    return @[savedRecipesVC, searchVC];
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
