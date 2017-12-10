//
//  SavedRecipesTableViewCell.m
//  RecipeApp
//
//  Created by Javier Xing on 2017-11-28.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "SavedRecipesTableViewCell.h"
#import "UIFont+Montserrat.h"
#import "UIFont+Inconsolata.h"
#import "UIFont+OpenSans.h"
#import "MaterialRobotoFontLoader.h"

@implementation SavedRecipesTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.labelBackView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
    self.savedRecipeImageView.contentMode = UIViewContentModeScaleAspectFill;
    
//    self.savedRecipeName.font = [UIFont montserratFontOfSize:18.0f];
//    self.savedRecipeRating.font = [UIFont montserratFontOfSize:18.0f];
//    self.savedRecipeTime.font = [UIFont montserratFontOfSize:18.0f];
    
    
    
//    self.savedRecipeName.font = [UIFont inconsolataFontOfSize:18.0f];
//    self.savedRecipeName.font = [UIFont openSansFontOfSize:18.0f];
//    UIFont *font = [[MDFRobotoFontLoader sharedInstance] regularFontOfSize:16];
//    self.savedRecipeName.font = font;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
