//
//  HeaderView.m
//  LifeGame
//
//  Created by na on 2014/08/25.
//  Copyright (c) 2014年 LifeGame. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

@synthesize naviBar = _naviBar;
@synthesize naviItem = _naviItem;
@synthesize configButton = _configButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    /* ナビゲーションバー */
    _naviBar.frame = CGRectMake(0.0f,
                               0.0f,
                               self.frame.size.width,
                               self.frame.size.height);
    
}

- (void)initView
{
    _naviBar = [[UINavigationBar alloc]init];
    _naviItem = [[UINavigationItem alloc]init];
    
    UIBarButtonItem *playButton = [[UIBarButtonItem alloc] initWithTitle:@"Play" style:UIBarButtonItemStyleBordered target:self action:@selector(playEvent:)];

    UIBarButtonItem *stopButton = [[UIBarButtonItem alloc] initWithTitle:@"Stop" style:UIBarButtonItemStyleBordered target:self action:@selector(stopEvent:)];
    
    UIBarButtonItem *resetButton = [[UIBarButtonItem alloc] initWithTitle:@"Reset" style:UIBarButtonItemStyleBordered target:self action:@selector(resetEvent:)];
    
    _naviItem.leftBarButtonItems = [NSMutableArray arrayWithObjects:playButton, stopButton, resetButton, nil];

    _configButton = [[UIBarButtonItem alloc] initWithTitle:@"config" style:UIBarButtonItemStyleBordered target:self action:@selector(showPopup:)];
    
    _naviItem.rightBarButtonItems = [NSMutableArray arrayWithObjects:_configButton, nil];
    
    [_naviBar pushNavigationItem:_naviItem animated:YES];

    [self addSubview:_naviBar];
}

- (void)playEvent:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(playButtonEvent)]) {
        [self.delegate playButtonEvent];
    }
}


- (void)stopEvent:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(stopButtonEvent)]) {
        [self.delegate stopButtonEvent];
    }
}

- (void)resetEvent:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(resetButtonEvent)]) {
        [self.delegate resetButtonEvent];
    }
}

- (void)showPopup:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(popupButtonEvent)]) {
        [self.delegate popupButtonEvent];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
