//
//  SearchResultRecipe.h
//  RecipeApp
//
//  Created by Daniel Grosman on 2017-11-29.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchResultRecipe : NSObject

@property (nonatomic,strong) NSString *recipeName;
@property (nonatomic,strong) NSString *recipeID;
@property (nonatomic,strong) NSString *totalTime;
@property (nonatomic,strong) NSString *smallPictureURL;
@property (nonatomic,strong) NSString *largePictureURL;
@property (nonatomic,strong) NSString *ingredients;
@property (nonatomic,strong) NSURL *recipeURL;
@property (nonatomic,assign) float rating;
@property (nonatomic,assign) float protein;
@property (nonatomic,assign) float calories;
@property (nonatomic,assign) float sugar;
@property (nonatomic,assign) float fat;
@property (nonatomic,assign) float carbs;

- (instancetype)initWithInfo:(NSDictionary*)dict;
- (void)setRecipeDetails:(NSDictionary*)info;


@end
