//
//  ViewController.m
//  D
//
//  Created by Reza on 9/7/14.
//  Copyright (c) 2014 Sample. All rights reserved.
//

#import "ViewController.h"
#import "OptionsVC.h"
#include <tgmath.h>
#import <QuartzCore/QuartzCore.h>

#pragma GCC diagnostic ignored "-Wundeclared-selector"

@interface ViewController ()

{
    OptionsVC * optionVCInstance;
    //CriterionsVC * criterionVCInstance;
    
    UIView*optionsRefrenceView;

    UIView*optionsView;
    UIView*CriterionsView;
    
    UITextField * criterionTitleTextField;
    UITextField * optionTextField;

    
    UITextView * optionTextview;
    UITextView * criterionDescripTextview;
    UIButton *doneButton;
    UIButton *cancelButton;
}

@property (nonatomic, strong) UIDynamicAnimator * optionAnimator;
@property (nonatomic, strong) UIDynamicBehavior *viewBehavior;
@property (nonatomic, strong) UIGravityBehavior *gravityBehavior;
@property (nonatomic, strong) UICollisionBehavior *collisionBehavior;
@property (nonatomic, strong) UIView *Square;
//@property (nonatomic , strong)    UITextField * optionTextField;

@end

@implementation ViewController

@synthesize optionsArray;
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self preferredStatusBarStyle];
 
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background2.png"]];
    CGRect optionsTableViewRect =  CGRectMake(20,130,280, 250);
    optionsView = [[UIView alloc] initWithFrame: optionsTableViewRect];
    optionVCInstance  = [[OptionsVC alloc]init];
    [optionsView addSubview:optionVCInstance.view];
    [self.view addSubview:optionsView];
    [addOption addTarget:self action:@selector(showAddOptionView:) forControlEvents:UIControlEventTouchUpInside];

}
-(void)showAddOptionView:(UIButton *)sender{
    _Square = [[UIView alloc]initWithFrame:CGRectMake(-300, 60, 270, 230)];
    [self.view addSubview: _Square];
    CALayer *squareBorder = [ _Square layer];
    [[ _Square layer] setBorderWidth:6.0f];
    [[ _Square layer] setBorderColor:[[UIColor colorWithRed:(203/255.0) green:(119/255.0) blue:(223/255.0) alpha:1] CGColor]];
    [squareBorder setMasksToBounds:YES];
    [squareBorder setCornerRadius:30.0f];
     _Square.backgroundColor = [UIColor colorWithRed:(0/255.0) green:(122/255.0) blue:(255/255.0) alpha:0.6];
    
    //Setting Up the textfield
    optionTextField = [[UITextField alloc] initWithFrame:CGRectMake(15, 15, 240, 30)];
    optionTextField.backgroundColor =[UIColor whiteColor];
    optionTextField.borderStyle = UITextBorderStyleRoundedRect;
    optionTextField.font = [UIFont systemFontOfSize:15];
    optionTextField.placeholder = @" Option's title";

//    optionTextField.keyboardType = UIKeyboardTypeDefault;
//    optionTextField.returnKeyType = UIReturnKeyDone;
//    optionTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    optionTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    optionTextField.delegate = self;
    optionTextField.tintColor = [UIColor purpleColor];
    CALayer *optTxtFieldLayer = [optionTextField layer];
    [[optionTextField layer] setBorderWidth:2.0f];
    [[optionTextField layer] setBorderColor:[[UIColor colorWithRed:(203/255.0) green:(119/255.0) blue:(223/255.0) alpha:1] CGColor]];
    [optTxtFieldLayer setMasksToBounds:YES];
    [optTxtFieldLayer setCornerRadius:10.0f];

    [_Square addSubview:optionTextField];
    
    //Setting up the textView
  

    //Setting up Buttons
    
     doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [doneButton setFrame:CGRectMake(220, 200, 70, 30)];
    doneButton.center = CGPointMake(220 ,200);
    doneButton.backgroundColor = [UIColor clearColor];
    [doneButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [doneButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [doneButton addTarget:self action:@selector(doneButtonPressed:) forControlEvents:UIControlEventTouchUpInside];

    CALayer *doneLayer = [doneButton layer];
        [[doneButton layer] setBorderWidth:2.5f];
        [[doneButton layer] setBorderColor:[[UIColor whiteColor]CGColor]];
        [doneLayer setMasksToBounds:YES];
        [doneLayer setCornerRadius:12.0f];
 
 
        [_Square addSubview:doneButton];
         
    /////Adding Cancel Button
         cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
         
         [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
         [cancelButton setFrame:CGRectMake(140, 200, 70, 30)];
         cancelButton.center = CGPointMake(140 ,200);
         cancelButton.backgroundColor = [UIColor clearColor];
         [cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
         [cancelButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
         [cancelButton addTarget:self action:@selector(cancelButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
         
         CALayer *cancelLayer = [cancelButton layer];
         [[cancelButton layer] setBorderWidth:2.5f];
         [[cancelButton layer] setBorderColor:[[UIColor whiteColor]CGColor]];
         [cancelLayer setMasksToBounds:YES];
         [cancelLayer setCornerRadius:12.0f];
         
         
         [_Square addSubview:cancelButton];
         
        [self demoGravityWithView: _Square];
    [addOption setUserInteractionEnabled:NO];
    addOption.enabled = NO;
     //usleep(150000);
     [NSThread sleepForTimeInterval:0.4];
    NSLog(@"showAddOptionView Ended");
//    dispatch_async(dispatch_get_main_queue(), ^{
//
//      });

}
-(void)demoGravityWithView:(UIView*)MyView{
    
    NSLog(@"demoGravityWithView is called");
    _optionAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    _optionAnimator.delegate = self;
    _gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[MyView]];
    _gravityBehavior.gravityDirection = CGVectorMake(1.5,0);
    [ _optionAnimator addBehavior: _gravityBehavior];
    
    _collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[MyView]];
    _collisionBehavior.collisionDelegate = self;
    CGPoint pointA = CGPointMake(293, 30);
    CGPoint pointB = CGPointMake(293, 400);
    
    [ _collisionBehavior addBoundaryWithIdentifier:@"rightSideWall" fromPoint:pointA toPoint:pointB];
    
    [ _optionAnimator addBehavior: _collisionBehavior];
    
    [self makeItFirstResponder];
    
}
-(void)makeItFirstResponder{
    //    dispatch_async(dispatch_get_main_queue(), ^{
    //    });
    [optionTextField becomeFirstResponder];
    
}

-(Option*) returnNewOption{
    NSLog(@"RETUUUUUUURRRNNN");
    Option * newOption= [[Option alloc] init];
     newOption.titleOfOption= [NSString stringWithFormat:@"  %@",optionTextField.text];
    //newOption.descriptionForOption = optionTextview.text;
    return newOption;
    
}
-(void)cancelButtonPressed : (UIButton*)sender {

    [UIView animateWithDuration:0.6
                     animations:^{[_Square setAlpha:0.0f];}
                     completion:^(BOOL finished){ [_Square removeFromSuperview];
                     }];
    [addOption setUserInteractionEnabled:YES];
    addOption.enabled = YES;

    
}
-(void)doneButtonPressed:(UIButton *)sender{
    Option * addedOption = [self returnNewOption];
    [optionsArray addObject:addedOption];
    //[optionVCInstance updateOptionsArray :addedOption];
    NSLog(@">>>>>>>>>>>>>>>>>>>>>>>>>>>><<<>>>>addedOption.titleOfOption = %@ ",addedOption.titleOfOption);
    [optionVCInstance updateOptionsArray:addedOption];
    [UIView animateWithDuration:0.6
                     animations:^{[_Square setAlpha:0.0f];}
                     completion:^(BOOL finished){ [_Square removeFromSuperview];
                      }];
    [addOption setUserInteractionEnabled:YES];
    addOption.enabled = YES;
 }

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
