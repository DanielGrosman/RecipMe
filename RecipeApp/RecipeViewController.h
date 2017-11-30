//
//  RecipeViewController.h
//  RecipeApp
//
//  Created by Javier Xing on 2017-11-28.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe+CoreDataProperties.h"
#import "SearchResultRecipe.h"

@interface RecipeViewController : UIViewController

@property (nonatomic, strong) SearchResultRecipe *selectedRecipe;
@property (strong, nonatomic) NSArray *ingredientsArray;

-(void)setupRecipe;

@end
