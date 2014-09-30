//
//  Option.h
//  D
//
//  Created by Reza on 9/12/14.
//  Copyright (c) 2014 Sample. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Option : NSObject

@property (nonatomic,readwrite,strong) NSString * titleOfOption;
@property (nonatomic,readwrite,strong) NSString * descriptionOfOption;
@property (nonatomic) NSInteger  totalOptionsScore;
@property (nonatomic,readwrite,strong) NSMutableArray*optionsCritsArray;

@end
