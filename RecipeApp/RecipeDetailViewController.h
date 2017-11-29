//
//  RecipeDetailViewController.h
//  RecipeApp
//
//  Created by Javier Xing on 2017-11-28.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe+CoreDataProperties.h"

@interface RecipeDetailViewController : UIViewController
@property (nonatomic, strong)Recipe *recipe;

@end
