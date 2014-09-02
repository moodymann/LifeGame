//
//  PopUpViewController.h
//  LifeGame
//
//  Created by na on 2014/08/26.
//  Copyright (c) 2014年 LifeGame. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PopupDelegate;

@interface PopUpViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, weak) id<PopupDelegate> delegate;
@property(nonatomic,retain)UITableView *tableView;

@end

@protocol PopupDelegate <NSObject, UITableViewDelegate>

@optional
- (void)selectPattern:(NSIndexPath *)index;
@end