//
//  TestFontsViewController.m
//  RecipeApp
//
//  Created by Daniel Grosman on 2017-11-30.
//  Copyright © 2017 Daniel Grosman. All rights reserved.
//

#import "TestFontsViewController.h"
#import "UIFont+Montserrat.h"
#import "UIFont+Inconsolata.h"
#import "UIFont+OpenSans.h"
#import "MaterialRobotoFontLoader.h"

@interface TestFontsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *montserratLabel;
@property (weak, nonatomic) IBOutlet UILabel *inconsolataLabel;
@property (weak, nonatomic) IBOutlet UILabel *openSansLabel;
@property (weak, nonatomic) IBOutlet UILabel *robotoLabel;

@end

@implementation TestFontsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.montserratLabel.text = @" TESTING testing";
    self.inconsolataLabel.text = @" TESTING testing";
    self.openSansLabel.text = @" TESTING testing";
    self.robotoLabel.text = @" TESTING testing";
    
        self.montserratLabel.font = [UIFont montserratFontOfSize:20.0f];
        self.inconsolataLabel.font = [UIFont inconsolataFontOfSize:20.0f];
        self.openSansLabel.font = [UIFont openSansFontOfSize:20.0f];
        UIFont *font = [[MDFRobotoFontLoader sharedInstance] regularFontOfSize:20.0f];
        self.robotoLabel.font = font;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
