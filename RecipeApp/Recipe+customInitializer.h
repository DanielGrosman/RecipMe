//
//  Recipe+customInitializer.h
//  RecipeApp
//
//  Created by Javier Xing on 2017-11-28.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "Recipe+CoreDataClass.h"

@interface Recipe (customInitializer)


- (instancetype)initWithContext:(NSManagedObjectContext *)moc info:(NSDictionary*)dict;

-(void)setRecipeDetails:(NSDictionary*)info;

@end
