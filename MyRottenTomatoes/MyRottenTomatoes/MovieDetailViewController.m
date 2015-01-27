//
//  MovieDetailViewController.m
//  MyRottenTomatoes
//
//  Created by Neelakandan Rajesh on 1/25/15.
//  Copyright (c) 2015 Rajesh. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "UIImageView+AFNetworking.h"

@interface MovieDetailViewController ()

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.labelSynopsis.text = self.movie[@"synopsis"];
    self.labelTitle.text = self.movie[@"title"];
    NSString* movieThumbUrl = [self.movie valueForKeyPath:@"posters.thumbnail"];
    NSString* movieOriUrl = [movieThumbUrl stringByReplacingOccurrencesOfString:@"tmb" withString:@"ori"];
    [self.imageFullView setImageWithURL:[NSURL URLWithString:movieThumbUrl]];
    [self.imageFullView setImageWithURL:[NSURL URLWithString:movieOriUrl]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
