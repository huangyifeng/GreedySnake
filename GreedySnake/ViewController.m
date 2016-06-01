//
//  ViewController.m
//  GreedySnake
//
//  Created by huang yifeng on 16/5/27.
//  Copyright © 2016年 hyf. All rights reserved.
//

#import "ViewController.h"
#import "GSMap.h"
#import "GSSnake.h"
#import "GSGameController.h"

@interface ViewController ()

//Model
@property(nonatomic, strong)GSGameController *gameController;

//UI
@property(nonatomic, weak)IBOutlet UIImageView *imageView;

- (void)initModelComponent;
- (void)initViewComponent;

- (void)newGameButtonHandler;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self initModelComponent];
    [self initViewComponent];
}

#pragma mark - private

- (void)initModelComponent
{
    GSSnake *snake = [[GSSnake alloc] init];
    
    CGSize size = _imageView.frame.size;
    NSInteger row = floorf(size.height / MAP_GRID_SIZE);
    NSInteger column = floorf(size.width / MAP_GRID_SIZE);
    GSMap *map = [[GSMap alloc] initWithRow:row column:column];
    
    self.gameController = [[GSGameController alloc] initWithMap:map snake:snake];
}

- (void)initViewComponent
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"New Game" style:UIBarButtonItemStylePlain target:self action:@selector(newGameButtonHandler)];
}

- (void)newGameButtonHandler
{
    [self.gameController newGameStart];
}

@end
