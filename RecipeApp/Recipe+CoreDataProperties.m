//
//  Recipe+CoreDataProperties.m
//  RecipeApp
//
//  Created by Daniel Grosman on 2017-11-28.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//
//

#import "Recipe+CoreDataProperties.h"

@implementation Recipe (CoreDataProperties)

+ (NSFetchRequest<Recipe *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Recipe"];
}

@dynamic calories;
@dynamic carbohydrate;
@dynamic fat;
@dynamic id;
@dynamic ingredients;
@dynamic largePictureURL;
@dynamic protein;
@dynamic rating;
@dynamic recipeName;
@dynamic recipeURL;
@dynamic smallPictureURL;
@dynamic sugar;
@dynamic totalTime;

@end
