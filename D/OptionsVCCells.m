//
//  OptionsVCCells.m
//  D
//
//  Created by Reza on 9/8/14.
//  Copyright (c) 2014 Sample. All rights reserved.
//

#import "OptionsVCCells.h"
 
@implementation OptionsVCCells
@synthesize optionsTitleLabel = _optionsTitleLabel;
@synthesize optCellContainerView = _optCellContainerView;

 
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier ];
    if (self) {
        
         _optionsTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(2, 2, 280, 50)];
         _optionsTitleLabel.textColor = [UIColor whiteColor];
         _optionsTitleLabel.font = [UIFont fontWithName:@"segoe-ui-1361529660" size:19.0f];
         _optionsTitleLabel.backgroundColor =[UIColor blueColor];

        _optCellContainerView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 278, 50)];
        _optCellContainerView.backgroundColor = [UIColor grayColor];
        _optCellContainerView.alpha = 0.8;
        [_optCellContainerView   addSubview:_optionsTitleLabel];
        
        
//        CALayer *optCellLayer = [ _optCellContainerView layer];
//        [[ _optCellContainerView layer] setBorderWidth:6.0f];
//        [[ _optCellContainerView layer] setBorderColor:[[UIColor colorWithRed:(203/255.0) green:(119/255.0) blue:(223/255.0) alpha:1] CGColor]];
//        [optCellLayer setMasksToBounds:YES];
//        [optCellLayer setCornerRadius:30.0f];

         [self addSubview:_optCellContainerView];
        //self.backgroundColor = [UIColor clearColor];
        self.viewForBaselineLayout.backgroundColor = [UIColor clearColor];
    }
    return self;
}



@end
