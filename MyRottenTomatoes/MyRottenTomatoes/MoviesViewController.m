//
//  MoviesViewController.m
//  MyRottenTomatoes
//
//  Created by Neelakandan Rajesh on 1/25/15.
//  Copyright (c) 2015 Rajesh. All rights reserved.
//

#import "MoviesViewController.h"
#import "MovieCellTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "MovieDetailViewController.h"
#import  <SVProgressHUD.h>

@interface MoviesViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *movies;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (nonatomic,strong) NSString* rottenUrl;
-(void) loadMovies: (NSString*) surl;
-(void) onRefresh;
@end

@implementation MoviesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 128;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"MovieCell"];
    self.rottenUrl = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=rzhptcs33wbdq8hkjzugnn5j";
//    self.rottenUrl = @"http://api.rottentomatoes1.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=rzhptcs33wbdq8hkjzugnn5j";
    [self loadMovies:self.rottenUrl];
    
    self.refreshControl = [[UIRefreshControl alloc]init ] ;
    [self.refreshControl addTarget:self action: @selector(onRefresh) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:self.refreshControl atIndex: 0];
}

-(void) onRefresh {
    [self loadMovies:self.rottenUrl];
}


-(void) loadMovies: (NSString*) surl {
    [SVProgressHUD showWithStatus:@"loading rotten"];

    NSURL* url = [[NSURL alloc]initWithString:surl];
    NSLog(@"Calling url %@",surl);
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    NSLog(@"Url request formed %@", request);
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (connectionError == nil)
        {
            NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
            
    //        NSLog(@"obtained data%@", [NSJSONSerialization JSONObjectWithData:data options:0 error:nil]  );
            self.movies = json[@"movies"];
    //        NSLog(@"Setting movies to %lu", (unsigned long)self.movies.count);
            [self.tableView reloadData];
        }
        else
        {
            [SVProgressHUD showErrorWithStatus:@"Network Error"];
            [self.navigationController setTitle:@"Network Error"];
        }

        [self.refreshControl endRefreshing];
        [SVProgressHUD dismiss];
    }];
    NSLog(@"Call completed asynchly");
    //    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //    NSLog(@"Obtained data %@", data);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieDetailViewController* mdvc = [MovieDetailViewController alloc];
    NSDictionary* movie = self.movies[indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    mdvc.movie = movie;
    [self.navigationController pushViewController:mdvc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"framework called number of rows %lu", (unsigned long)[self.movies count]);
    if (self.movies)
    {
        return self.movies.count;
    }
    else
    {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCellTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    if (self.movies)
    {
        NSDictionary* movie = self.movies[indexPath.row];
        cell.labelMovieTitle.text = movie[@"title"];
        cell.labelMovieSynopsis.text = movie[@"synopsis"];
        [cell.movieThumbNail setImageWithURL:[NSURL URLWithString:[movie valueForKeyPath:@"posters.thumbnail"]]];
    }
    else
    {
        cell.textLabel.text = @"Testing";
    }
    return cell;
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
