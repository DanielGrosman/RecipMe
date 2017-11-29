//
//  SavedRecipesTableViewCell.h
//  RecipeApp
//
//  Created by Javier Xing on 2017-11-28.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SavedRecipesTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *savedRecipeImageView;
@property (weak, nonatomic) IBOutlet UILabel *savedRecipeName;
@property (weak, nonatomic) IBOutlet UILabel *savedRecipeRating;
@property (weak, nonatomic) IBOutlet UILabel *savedRecipeTime;

@end
