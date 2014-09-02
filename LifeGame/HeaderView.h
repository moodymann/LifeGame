//
//  HeaderView.h
//  LifeGame
//
//  Created by na on 2014/08/25.
//  Copyright (c) 2014年 LifeGame. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIPopover+iPhone.h"
#import "PopUpViewController.h"

@protocol HeaderDelegate;

@interface HeaderView : UIView
<UIPopoverControllerDelegate>

@property(nonatomic, weak) id<HeaderDelegate> delegate;

@property(nonatomic, retain)UINavigationBar *naviBar;
@property(nonatomic, retain)UINavigationItem *naviItem;
@property(nonatomic, retain)UIBarButtonItem *configButton;
@end


@protocol HeaderDelegate <NSObject>

- (void)playButtonEvent;
- (void)stopButtonEvent;
- (void)resetButtonEvent;
- (void)popupButtonEvent;
@end