//
//  Recipe+customInitializer.m
//  RecipeApp
//
//  Created by Javier Xing on 2017-11-28.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "Recipe+customInitializer.h"

@implementation Recipe (customInitializer)


- (instancetype)initWithContext:(NSManagedObjectContext *)moc info:(NSDictionary*)dict
{
    self = [super initWithContext:moc];
    if (self) {
        self.rating = [dict[@"rating"] floatValue];
        self.recipeName = dict[@"recipeName"];
        self.smallPictureURL = dict[@"smallImageUrls"][0];
        NSArray *ingredients = (NSArray*)dict[@"ingredients"];
        self.ingredients = [ingredients componentsJoinedByString:@", "];
        self.recipeID = dict[@"id"];
        NSString *timeString = [NSString stringWithFormat:@"%@",dict[@"totalTimeInSeconds"]];
        self.totalTime = timeString;
    }
    return self;
}


-(void)setRecipeDetails:(NSDictionary*)info{
    

    NSArray *nutritionEst = info[@"nutritionEstimates"];
    if (nutritionEst.count >0) {
        for (NSDictionary* nutrientInfo in nutritionEst) {
//            Calories
            if ([nutrientInfo[@"attribute"] isEqualToString:@"ENERC_KCAL"]) {
                self.calories = [nutrientInfo[@"value"] floatValue];
            }
//            Protein
            if ([nutrientInfo[@"attribute"] isEqualToString:@"PROCNT"]) {
                self.protein = [nutrientInfo[@"value"] floatValue];
            }
//            Sugar
            if ([nutrientInfo[@"attribute"] isEqualToString:@"SUGAR"]) {
                self.sugar = [nutrientInfo[@"value"] floatValue];
            }
//            Fat
            if ([nutrientInfo[@"attribute"] isEqualToString:@"FAT"]) {
                self.fat = [nutrientInfo[@"value"] floatValue];
            }
//            Carbohydrate
            if ([nutrientInfo[@"attribute"] isEqualToString:@"CHOCDF"]) {
                self.carbohydrate = [nutrientInfo[@"value"] floatValue];
            }
        }
    }
    else{
        self.calories = NAN;
        self.protein = NAN;
        self.sugar = NAN;
        self.fat = NAN;
        self.carbohydrate = NAN;
    }
    
    
    self.recipeURL = info[@"source"][@"sourceRecipeUrl"];
    NSLog(@"%@",info[@"images"][0][@"hostedLargeUrl"]);
}




@end
