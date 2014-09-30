//
//  Criterion.h
//  D
//
//  Created by Reza on 9/12/14.
//  Copyright (c) 2014 Sample. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Criterion : NSObject

@property (nonatomic,readwrite,strong) NSString * titleOfCriterion;
@property (nonatomic,readwrite,strong) NSString * descriptionForCriterion;

@property (nonatomic,readwrite) NSInteger priorityRate;
@property (nonatomic,readwrite) NSInteger score;


@end
