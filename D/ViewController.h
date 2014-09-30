//
//  ViewController.h
//  D
//
//  Created by Reza on 9/7/14.
//  Copyright (c) 2014 Sample. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Criterion.h"
#import "Option.h"

//@protocol updateOptionsAndCriterionsDelegate <NSObject>
//@optional
//
////-(void)addCriterionToCriterionsArray:(Criterion*)newCriterion;
////-(void)updateOptionsArray : (Option*)newOptionFromOptionVC ;
//
//@end
//
@interface ViewController : UIViewController <UIScrollViewDelegate,UITextFieldDelegate,UITextViewDelegate,UIDynamicAnimatorDelegate,UICollisionBehaviorDelegate>
{
    
    __weak IBOutlet UIButton *addCriterion;
    __weak IBOutlet UIButton *addOption;
    __weak IBOutlet UIButton *resultButton;
 }

//@property (weak,nonatomic) id <updateOptionsAndCriterionsDelegate> delegate;

@property (nonatomic,strong)NSMutableArray * optionsArray;
 
@end
