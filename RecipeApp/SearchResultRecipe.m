//
//  SearchResultRecipe.m
//  RecipeApp
//
//  Created by Daniel Grosman on 2017-11-29.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "SearchResultRecipe.h"

@implementation SearchResultRecipe

- (instancetype)initWithInfo:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        _rating = [dict[@"rating"] floatValue];
        _recipeName = dict[@"recipeName"];
        _smallPictureURL = dict[@"smallImageUrls"][0];
        NSArray *ingredients = (NSArray*)dict[@"ingredients"];
        _ingredients = [ingredients componentsJoinedByString:@", "];
        _recipeID = dict[@"id"];
        NSString *timeString = [NSString stringWithFormat:@"%@",dict[@"totalTimeInSeconds"]];
        _totalTime = timeString;
    }
    return self;
}

-(void)setRecipeDetails:(NSDictionary *)info {
    
    NSArray *nutritionEst = info[@"nutritionEstimates"];
    if (nutritionEst.count >0) {
        for (NSDictionary* nutrientInfo in nutritionEst) {
            //            Calories
            if ([nutrientInfo[@"attribute"] isEqualToString:@"ENERC_KCAL"]) {
                _calories = [nutrientInfo[@"value"] floatValue];
            }
            //            Protein
            if ([nutrientInfo[@"attribute"] isEqualToString:@"PROCNT"]) {
                _protein = [nutrientInfo[@"value"] floatValue];
            }
            //            Sugar
            if ([nutrientInfo[@"attribute"] isEqualToString:@"SUGAR"]) {
                _sugar = [nutrientInfo[@"value"] floatValue];
            }
            //            Fat
            if ([nutrientInfo[@"attribute"] isEqualToString:@"FAT"]) {
                _fat = [nutrientInfo[@"value"] floatValue];
            }
            //            Carbohydrate
            if ([nutrientInfo[@"attribute"] isEqualToString:@"CHOCDF"]) {
                _carbs = [nutrientInfo[@"value"] floatValue];
            }
        }
    }
    else{
        self.calories = NAN;
        self.protein = NAN;
        self.sugar = NAN;
        self.fat = NAN;
        self.carbs = NAN;
    }
    
    self.recipeURL = info[@"source"][@"sourceRecipeUrl"];
    self.largePictureURL = info[@"images"][0][@"hostedLargeUrl"];
}



@end
