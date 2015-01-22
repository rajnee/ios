//
//  TipManager.h
//  SimpleTipCalc1
//
//  Created by Neelakandan Rajesh on 1/21/15.
//  Copyright (c) 2015 Neelakandan Rajesh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TipManager : NSObject
    +(int) getTipForIndex:(int) tipIndex;
    +(int) getIndexForTip:(int) tip;
    +(int) getDefaultTip;
    +(void) saveDefaultTip: (int) tip;
@end
