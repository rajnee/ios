//
//  SettingsViewController.m
//  SimpleTipCalc1
//
//  Created by Neelakandan Rajesh on 1/21/15.
//  Copyright (c) 2015 Neelakandan Rajesh. All rights reserved.
//

#import "SettingsViewController.h"
#import "TipManager.h"
@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textDefaultTip;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedTip;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {

    int intValue = [TipManager getDefaultTip];
    self.segmentedTip.selectedSegmentIndex =
        [TipManager getIndexForTip:intValue];
}

- (void)viewDidDisappear:(BOOL)animated {
    int t =
        [TipManager getTipForIndex:self.segmentedTip.selectedSegmentIndex];
    [TipManager saveDefaultTip:t];
}
/*
#pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little pNSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
 NSString *stringValue = [defaults objectForKey:@"some_key_that_you_choose"];
 int intValue = [defaults integerForKey:@"another_key_that_you_choose"];reparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
