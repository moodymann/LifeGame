//
//  ViewController.h
//  LifeGame
//
//  Created by na on 2014/08/25.
//  Copyright (c) 2014年 LifeGame. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"
#import "LifeView.h"
#import "PopUpViewController.h"
#import "UIPopover+iPhone.h"

@interface ViewController : UIViewController
<HeaderDelegate, PopupDelegate, UIPopoverControllerDelegate, UITableViewDelegate>

@property(nonatomic, retain)HeaderView *headerView;
@property(nonatomic, retain)LifeView *lifeView;
@property(nonatomic, retain)UIPopoverController *pop;
@end
