//
//  LifeView.h
//  LifeGame
//
//  Created by na on 2014/08/25.
//  Copyright (c) 2014年 LifeGame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LifeView : UIView

- (void)resetCellState;
- (void)cellPattern:(NSInteger)index;
@end
