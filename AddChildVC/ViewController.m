//
//  ViewController.m
//  AddChildVC
//
//  Created by Ken on 2017/2/3.
//  Copyright © 2017年 AIA. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIViewController *currentVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)leftClick:(id)sender
{
    [self didRemoveCurrentVC];
    
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    self.currentVC = firstVC;
    
    [self addChildVC];
    
}

- (IBAction)rightClick:(id)sender
{
    [self didRemoveCurrentVC];

    SecondViewController *secondVC = [[SecondViewController alloc] init];
    self.currentVC = secondVC;
    
    [self addChildVC];
}

-(void)addChildVC
{
    [self addChildViewController:self.currentVC];
    //addChildViewController 会调用 [child willMoveToParentViewController:self] 方法，但是不会调用 didMoveToParentViewController:方法，官方建议显示调用
    [self.currentVC didMoveToParentViewController:self];
    self.currentVC.view.frame = CGRectMake(0, 100, 400, 300);
    [self.view addSubview:self.currentVC.view];
}

- (void)didRemoveCurrentVC
{
    if (self.currentVC)
    {
        [self.currentVC.view removeFromSuperview];
        [self.currentVC removeFromParentViewController];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
