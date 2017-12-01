//
//  SavedRecipesTableViewCell.m
//  RecipeApp
//
//  Created by Javier Xing on 2017-11-28.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "SavedRecipesTableViewCell.h"

@implementation SavedRecipesTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.labelBackView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
    self.savedRecipeImageView.contentMode = UIViewContentModeScaleAspectFill;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
