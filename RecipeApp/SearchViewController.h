//
//  SearchViewController.h
//  RecipeApp
//
//  Created by Javier Xing on 2017-11-27.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FetchDataDelegate <NSObject>

-(void)fetchData:(NSString*)searchString;

@end
@interface SearchViewController : UIViewController <UISearchResultsUpdating, UISearchBarDelegate>

@property (nonatomic, weak) id<FetchDataDelegate>delegate;

@end
