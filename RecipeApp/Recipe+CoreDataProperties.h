//
//  Recipe+CoreDataProperties.h
//  RecipeApp
//
//  Created by Daniel Grosman on 2017-11-28.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//
//

#import "Recipe+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Recipe (CoreDataProperties)

+ (NSFetchRequest<Recipe *> *)fetchRequest;

@property (nonatomic) float calories;
@property (nonatomic) float carbohydrate;
@property (nonatomic) float fat;
@property (nullable, nonatomic, copy) NSString *id;
@property (nullable, nonatomic, copy) NSString *ingredients;
@property (nullable, nonatomic, copy) NSString *largePictureURL;
@property (nonatomic) float protein;
@property (nonatomic) float rating;
@property (nullable, nonatomic, copy) NSString *recipeName;
@property (nullable, nonatomic, copy) NSString *recipeURL;
@property (nullable, nonatomic, copy) NSString *smallPictureURL;
@property (nonatomic) float sugar;
@property (nonatomic) NSString *totalTime;

@end

NS_ASSUME_NONNULL_END
