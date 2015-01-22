//
//  TipManager.m
//  SimpleTipCalc1
//
//  Created by Neelakandan Rajesh on 1/21/15.
//  Copyright (c) 2015 Neelakandan Rajesh. All rights reserved.
//

#import "TipManager.h"

@implementation TipManager

+(int)getDefaultTip {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"default_tip"];
    return intValue;
}

+(int)getIndexForTip:(int)tip {
    int index = 0;
    switch (tip) {
        case 10:
            index = 0;
            break;
            
        case 15:
            index = 1;
            break;
            
        case 20:
            index = 2;
            break;
            
        default:
            break;
    }
    return index;

}

+(void)saveDefaultTip:(int)tip
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:tip forKey:@"default_tip"];
    [defaults synchronize];

}

+(int)getTipForIndex:(int)tipIndex {
    int t = 10;
    switch (tipIndex) {
        case 1:
            t = 15;
            break;
            
        case 2:
            t  = 20;
            break;
            
        default:
            break;
    }
    return t;
}

@end
