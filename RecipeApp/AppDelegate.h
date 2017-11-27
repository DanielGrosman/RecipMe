//
//  AppDelegate.h
//  RecipeApp
//
//  Created by Daniel Grosman on 2017-11-27.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

