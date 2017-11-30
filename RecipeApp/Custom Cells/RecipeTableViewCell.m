//
//  RecipeTableViewCell.m
//  RecipeApp
//
//  Created by Javier Xing on 2017-11-27.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "RecipeTableViewCell.h"

@implementation RecipeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
    self.searchRecipeImageView.contentMode = UIViewContentModeScaleAspectFill;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
