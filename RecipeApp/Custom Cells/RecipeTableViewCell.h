//
//  RecipeTableViewCell.h
//  RecipeApp
//
//  Created by Javier Xing on 2017-11-27.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *searchRecipeImageView;
@property (weak, nonatomic) IBOutlet UILabel *searchRecipeName;
@property (weak, nonatomic) IBOutlet UILabel *searchRecipeRating;
@property (weak, nonatomic) IBOutlet UILabel *searchRecipeTime;
@property (weak, nonatomic) IBOutlet UIView *backView;



@end
