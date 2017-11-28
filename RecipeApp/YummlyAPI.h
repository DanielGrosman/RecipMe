//
//  YummlyAPI.h
//  RecipeApp
//
//  Created by Daniel Grosman on 2017-11-28.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YummlyAPI : NSObject

+ (void)searchFor:(NSString*)searchString complete:(void (^)(NSArray *results))done;



@end
