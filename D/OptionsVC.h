//
//  OptionsVC.h
//  D
//
//  Created by Reza on 9/8/14.
//  Copyright (c) 2014 Sample. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Option.h"
@interface OptionsVC : UIViewController 

//-(void)getOptionsArray : (NSMutableArray*)optArray;
-(void)updateOptionsArray : (Option*)newOptionFromOptionVC;

@end
