//
//  OptionsVC.m
//  D
//
//  Created by Reza on 9/8/14.
//  Copyright (c) 2014 Sample. All rights reserved.
//
#import "Option.h"
#import "OptionsVC.h"
#import "OptionsVCCells.h"
#import "ViewController.h"
@interface OptionsVC () <UITableViewDelegate, UITableViewDataSource> {
    Option*optionInstance;
    NSMutableArray *optionsArrayForTableView;

}
@property (nonatomic, strong) UITableView *optionsTableView;
@property (nonatomic, strong) OptionsVCCells *optCell;

@end

@implementation OptionsVC



- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    _optionsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,280, 250) style:UITableViewStylePlain];
    _optionsTableView.delegate = self;
    _optionsTableView.dataSource = self;
    _optionsTableView.separatorColor = [UIColor clearColor];
    _optionsTableView.backgroundColor = [UIColor clearColor];
    _optionsTableView.opaque = NO;
    _optionsTableView.backgroundView = nil;
     [self.view addSubview:_optionsTableView];
}

#pragma mark - UITableViewDataSource

 
-(NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    for (int i=0; i<optionsArrayForTableView.count; i++) {
        NSLog(@"optionsArrayForTableView >>>>>>> %@",[optionsArrayForTableView objectAtIndex:i]);
    }
    return  optionsArrayForTableView.count;
}

-(UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     if ([theTableView isEqual:_optionsTableView]){
        static NSString *cellIdentifier = @"OptionCell";
        optionInstance = [optionsArrayForTableView objectAtIndex:indexPath.row];
       _optCell = [[OptionsVCCells alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
       _optCell.optionsTitleLabel.text=optionInstance.titleOfOption;
     }
    return _optCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
         return 70;
 }
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [cell setBackgroundColor:[UIColor clearColor]];

    //1. Setup the CATransform3D structure
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ -600;
    
    
    //2. Define the initial state (Before the animation)
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    //!!!FIX for issue #1 Cell position wrong------------
    if(cell.layer.position.x != 0){
        cell.layer.position = CGPointMake(0, cell.layer.position.y);
    }
    
    //4. Define the final state (After the animation) and commit the animation
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.8];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
}
#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %ld row", (long)indexPath.row);
}
-(void)updateOptionsArray :(Option*)newOptionFromOptionVC {
    NSLog(@">>>>>>DELEGATE METHODE RUNNING>>>>><<<>>>>newOptionFromOptionVC.titleOfOption = %@ ", newOptionFromOptionVC.titleOfOption);
    if (!optionsArrayForTableView) {
        optionsArrayForTableView = [[NSMutableArray alloc]init];
    }
    [optionsArrayForTableView addObject:newOptionFromOptionVC];
    [_optionsTableView reloadData];
}
//- (void) viewWillAppear:(BOOL)animated{
//    [_optionsTableView reloadData];
//}
//-(void)getOptionsArray : (NSMutableArray*)optArray {
//
//    _optionsArrayForTableView = [NSMutableArray arrayWithArray:optArray];
//
//}
//- (void) viewWillAppear:(BOOL)animated{
//    [_optionsTableView reloadData];
//
//    for (int i=0; i<optionsArrayForTableView.count; i++) {
//        NSLog(@"optionsArrayForTableView >>>>>>> %@",[optionsArrayForTableView objectAtIndex:i]);
//    }
//}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender  {
//
//    if ([sender isKindOfClass:[OptionsVCCells class]]) {
//        if ([segue.destinationViewController isKindOfClass:[VC class]]) {
//            
//            VC* addSpaceVC = segue.destinationViewController;
//            addSpaceVC.delegate=self;
//        }
//    }
//}
@end

