//
//  MovieDetailViewController.h
//  MyRottenTomatoes
//
//  Created by Neelakandan Rajesh on 1/25/15.
//  Copyright (c) 2015 Rajesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *labelSynopsis;
@property (strong, nonatomic) IBOutlet UILabel *labelTitle;
@property (strong, nonatomic) NSDictionary* movie;
@end
