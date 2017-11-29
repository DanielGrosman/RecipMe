//
//  YummlyAPI.m
//  RecipeApp
//
//  Created by Daniel Grosman on 2017-11-28.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "YummlyAPI.h"
#import "Recipe+customInitializer.h"
#import "AppDelegate.h"


@implementation YummlyAPI

+ (void)searchFor:(NSString*)searchString complete:(void (^)(NSArray *results))done {
    AppDelegate *appDelegate =((AppDelegate*)[[UIApplication sharedApplication] delegate]);
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
//    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.yummly.com/v1/api/recipes?_app_id=d579354b&_app_key=cb9c178cd81196a30301abbb8d758481&maxResult=50&start=50&q=%@", searchString]];
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.yummly.com/v1/api/recipes?_app_id=d579354b&_app_key=cb9c178cd81196a30301abbb8d758481&q=%@", searchString]];
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"Error while making request: %@", error.localizedDescription);
            abort();
    }
        NSHTTPURLResponse *resp = (NSHTTPURLResponse*)response;
        if (resp.statusCode > 299) {
            NSLog(@"Bad status code: %ld", resp.statusCode);
            abort();
        }
        NSError *err = nil;
        NSDictionary *result = [NSJSONSerialization
                                JSONObjectWithData:data
                                options:0
                                error:&err];
        if (err != nil) {
            NSLog(@"Something has gone wrong parsing JSON in search: %@", err.localizedDescription);
            abort();
        }
        NSMutableArray *recipes = [[NSMutableArray alloc] init];
        for (NSDictionary *recipeInfo in result[@"matches"]) {
            Recipe *recipe = [[Recipe alloc] initWithContext:context info:recipeInfo];
            [recipes addObject:recipe];
        }
        done([NSArray arrayWithArray:recipes]);
    }];
    
    [task resume];
}

+(void)getRecipeDetailsFor:(Recipe*)recipe{
//    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.yummly.com/v1/api/recipe/%@?_app_id=d579354b&_app_key=cb9c178cd81196a30301abbb8d758481", recipe.recipeID]];
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"Error while making request: %@", error.localizedDescription);
            abort();
        }
        NSHTTPURLResponse *resp = (NSHTTPURLResponse*)response;
        if (resp.statusCode > 299) {
            NSLog(@"Bad status code: %ld", resp.statusCode);
            abort();
        }
//        JSON Parsing
        NSError *err = nil;
        NSDictionary *recipeDetails = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
        if (err != nil) {
            NSLog(@"Something has gone wrong parsing JSON in recipe details: %@", err.localizedDescription);
            abort();
        }
        [recipe setRecipeDetails:recipeDetails];
//        NSLog(@"%@", recipe);
        
    }];
    [task resume];
}








@end
