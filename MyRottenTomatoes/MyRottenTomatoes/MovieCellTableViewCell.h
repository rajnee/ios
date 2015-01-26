//
//  MovieCellTableViewCell.h
//  MyRottenTomatoes
//
//  Created by Neelakandan Rajesh on 1/25/15.
//  Copyright (c) 2015 Rajesh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelMovieTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelMovieSynopsis;
@property (weak, nonatomic) IBOutlet UIImageView *movieThumbNail;

@end
