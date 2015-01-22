//
//  TipViewController.m
//  SimpleTipCalc1
//
//  Created by Neelakandan Rajesh on 1/21/15.
//  Copyright (c) 2015 Neelakandan Rajesh. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"
#import "TipManager.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textBillAmount;
@property (weak, nonatomic) IBOutlet UILabel *labelTipAmount;
@property (weak, nonatomic) IBOutlet UILabel *labelTotalAmount;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentTipPercent;

@end

@implementation TipViewController
- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

-(void)updateValues {
    float billAmount = [self.textBillAmount.text floatValue];
    NSArray * tipValues = @[@(0.1), @(0.15), @(0.20)];
    float tipAmount = [tipValues[self.segmentTipPercent.selectedSegmentIndex] floatValue] * billAmount;
    
    self.labelTipAmount.text= [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.labelTotalAmount.text = [NSString stringWithFormat:@"$%0.2f", (tipAmount + billAmount)];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    self.segmentTipPercent.selectedSegmentIndex =
    [TipManager getIndexForTip:[TipManager getDefaultTip]];
}

-(void)viewWillAppear:(BOOL)animated {
    
}

-(void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
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
