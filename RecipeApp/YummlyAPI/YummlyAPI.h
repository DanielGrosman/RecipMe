//
//  YummlyAPI.h
//  RecipeApp
//
//  Created by Javier Xing on 2017-11-29.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Recipe+CoreDataProperties.h"
#import "Recipe+customInitializer.h"

@interface YummlyAPI : NSObject


+ (void)searchFor:(NSString*)searchString complete:(void (^)(NSArray *results))done;

+(void)getRecipeDetailsFor:(Recipe*)recipe complete:(void (^)(Recipe *))done;

@end

