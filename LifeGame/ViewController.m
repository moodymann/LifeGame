//
//  ViewController.m
//  LifeGame
//
//  Created by na on 2014/08/25.
//  Copyright (c) 2014年 LifeGame. All rights reserved.
//

#import "ViewController.h"
#import "UIPopover+iPhone.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSTimer *_timer;
}

@synthesize headerView = _headerView;
@synthesize lifeView = _lifeView;
@synthesize pop = _pop;

- (void)viewDidLoad
{
    [super viewDidLoad];
    _headerView = [[HeaderView alloc] init];
    _headerView.delegate = self;
    [self.view addSubview:_headerView];
    
    _lifeView = [[LifeView alloc] init];
    [self.view addSubview:_lifeView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews
{
    CGFloat margin_y = 20.0f;
    [super viewDidLayoutSubviews];
    _headerView.frame = CGRectMake(0.0f, margin_y, self.view.bounds.size.width, 30.0f);
    _lifeView.frame = CGRectMake(0.0f, _headerView.bounds.size.height + margin_y, self.view.bounds.size.width, 520.0f);
}

#pragma mark delegate

- (void)playButtonEvent
{
    [_timer invalidate], _timer = nil;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(_timerFired:) userInfo:nil repeats:YES];

    [self _timerFired:_timer];
}

- (void)stopButtonEvent
{
    [_timer invalidate], _timer = nil;
}

- (void)resetButtonEvent
{
    [_lifeView resetCellState];
    [_lifeView setNeedsDisplay];

}

- (void)popupButtonEvent
{
    PopUpViewController *vc = [[PopUpViewController alloc] init];
    vc.delegate = self;
    
    _pop = [[UIPopoverController alloc] initWithContentViewController:vc];
    _pop.delegate = self;
    
    _pop.popoverContentSize = CGSizeMake(100, 200);
    [_pop presentPopoverFromBarButtonItem:_headerView.configButton permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
}
- (void)selectPattern:(NSIndexPath *)index
{

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];                  //  選択状態の解除をします。
    [_lifeView cellPattern:indexPath.row];
}
- (void)_timerFired:(NSTimer *)timer
{
    [_lifeView setNeedsDisplay];
}
@end
