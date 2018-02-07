//
//  WebViewController.m
//  RecipeApp
//
//  Created by Daniel Grosman on 2018-02-07.
//  Copyright © 2018 Daniel Grosman. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    [self.webView loadRequest:request];
}

@end
