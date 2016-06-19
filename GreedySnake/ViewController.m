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

- (void)swipeHandler:(UISwipeGestureRecognizer *)swipe;

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
    self.gameController = [[GSGameController alloc] initWithMapSize:_imageView.frame.size];
    _gameController.delegate = self;
}

- (void)initViewComponent
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"New Game" style:UIBarButtonItemStylePlain target:self action:@selector(newGameButtonHandler)];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(swipeHandler:)];
    [self.view addGestureRecognizer:swipe];
    
}

#pragma mark - Action

- (void)newGameButtonHandler
{
    [self.gameController startNewGame];
}

- (void)swipeHandler:(UISwipeGestureRecognizer *)swipe
{
    
}

#pragma mark - GSGameControllerDelegate

- (void)hintGameOver
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:@"GAME OVER"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)updateWithImage:(UIImage *)image
{
    _imageView.image = image;
}

@end
