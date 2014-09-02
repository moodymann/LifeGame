//
//  LifeView.m
//  LifeGame
//
//  Created by na on 2014/08/25.
//  Copyright (c) 2014年 LifeGame. All rights reserved.
//

#import "LifeView.h"

#define CELL_NUMBER_HORIZON 400
#define CELL_NUMBER_VERTICAL 400

@implementation LifeView
{
    BOOL _cellState[CELL_NUMBER_HORIZON][CELL_NUMBER_VERTICAL];
    BOOL _cellStateDisplay[CELL_NUMBER_HORIZON][CELL_NUMBER_VERTICAL];
    BOOL isDisplay;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blackColor];
        
        [self resetCellState];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    for (NSInteger i = 0; i < CELL_NUMBER_VERTICAL; i++) {
        CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
        for (NSInteger j = 0; j < CELL_NUMBER_HORIZON; j++) {
            NSInteger cellCount = 0;
            // 自分のセルの上の行
            if (i != 0) {
                if (j != 0) {
                    if (_cellState[i - 1][j - 1]){
                        cellCount++;
                    }
                }
                if (_cellState[i - 1][j]) {
                    cellCount++;
                }
                if (j + 1 != CELL_NUMBER_HORIZON) {
                    if (_cellState[i - 1][j + 1]) {
                        cellCount++;
                    }
                }
            }
            // 自分のセル行
            if (j != 0) {
                if (_cellState[i][j - 1]){
                    cellCount++;
                }
            }
            if (j + 1 != CELL_NUMBER_HORIZON) {
                if (_cellState[i][j + 1]) {
                    cellCount++;
                }
            }
            //自分のセルの下の行
            if (i + 1 != CELL_NUMBER_VERTICAL) {
                if (j != 0) {
                    if (_cellState[i + 1][j - 1]){
                        cellCount++;
                    }
                }
                if (_cellState[i + 1][j]) {
                    cellCount++;
                }
                if (j + 1 != CELL_NUMBER_HORIZON) {
                    if (_cellState[i + 1][j + 1]) {
                        cellCount++;
                    }
                }
            }
            
            // 誕生
            if (!_cellStateDisplay[i][j]) {
                if (cellCount == 3) {
                    _cellStateDisplay[i][j] = YES;
                }
            }else{
                if (cellCount == 2 || cellCount == 3) { //生存
                    _cellStateDisplay[i][j] = YES;
                }else{ // 過疎か過密
                    _cellStateDisplay[i][j] = NO;
                }
            }
            
            // 描画
            if (_cellStateDisplay[i][j]) {
                CGContextSetRGBFillColor(context, 0.0f, 1.0f, 0.0f, 1.0f);
            }else{
                CGContextSetRGBFillColor(context, 0.0f, 0.0f, 0.0f, 1.0f);
//                CGContextSetRGBFillColor(context, 1.0f, 1.0f, 1.0f, 1.0f);
            }
            CGFloat size_w = self.bounds.size.width / CELL_NUMBER_VERTICAL;
            CGFloat size_y = self.bounds.size.height / CELL_NUMBER_HORIZON;
            CGContextFillRect(context, CGRectMake(size_w * j, size_y * i, size_w, size_y));
        }
    }
    CGContextRestoreGState(context);
    
    for (NSInteger i = 0; i < CELL_NUMBER_VERTICAL; i++) {
        for (NSInteger j = 0; j < CELL_NUMBER_HORIZON; j++) {
            _cellState[i][j] = _cellStateDisplay[i][j];
        }
    }
}

- (void)resetCellState
{
    // 乱数のシードを与える
    srand((unsigned)time(NULL));
    
    for (NSInteger i = 0; i < CELL_NUMBER_VERTICAL; i++) {
        for (NSInteger j = 0; j < CELL_NUMBER_HORIZON; j++) {
            if(random() % 2 == 0){
                _cellState[i][j] = YES;
            }else _cellState[i][j] = NO;
            _cellStateDisplay[i][j] = _cellState[i][j];
        }
    }
}

#pragma mark Event handling
- (void) touchesBegan:(NSSet *) touches withEvent:(UIEvent *) event
{
}


#pragma mark cell pattern
- (void)cellPattern:(NSInteger)index
{
    for (NSInteger i = 0; i < CELL_NUMBER_VERTICAL; i++) {
        for (NSInteger j = 0; j < CELL_NUMBER_HORIZON; j++) {
            _cellState[i][j] = NO;
             _cellStateDisplay[i][j] = _cellState[i][j];
        }
    }
    if (index == 0) {
        // グライダー銃
        _cellState[5][1] = YES;
        _cellState[6][1] = YES;
        _cellState[5][2] = YES;
        _cellState[6][2] = YES;
        
        _cellState[5][11] = YES;
        _cellState[6][11] = YES;
        _cellState[7][11] = YES;
        
        _cellState[4][12] = YES;
        _cellState[8][12] = YES;

        _cellState[3][13] = YES;
        _cellState[9][13] = YES;
        _cellState[3][14] = YES;
        _cellState[9][14] = YES;
        _cellState[6][15] = YES;
        _cellState[4][16] = YES;
        _cellState[8][16] = YES;
        _cellState[5][17] = YES;
        _cellState[6][17] = YES;
        _cellState[7][17] = YES;
        _cellState[6][18] = YES;

        _cellState[3][21] = YES;
        _cellState[4][21] = YES;
        _cellState[5][21] = YES;
        _cellState[3][22] = YES;
        _cellState[4][22] = YES;
        _cellState[5][22] = YES;
        _cellState[2][23] = YES;
        _cellState[6][23] = YES;
        _cellState[1][25] = YES;
        _cellState[2][25] = YES;
        _cellState[6][25] = YES;
        _cellState[7][25] = YES;

        _cellState[3][35] = YES;
        _cellState[4][35] = YES;
        _cellState[3][36] = YES;
        _cellState[4][36] = YES;
    }else if (index == 1){
        _cellState[8][1] = YES;
        _cellState[9][1] = YES;
        _cellState[10][1] = YES;
        _cellState[12][1] = YES;
        _cellState[13][1] = YES;
        _cellState[14][1] = YES;

        _cellState[8][5] = YES;
        _cellState[9][5] = YES;
        _cellState[10][5] = YES;
        _cellState[12][5] = YES;
        _cellState[13][5] = YES;
        _cellState[14][5] = YES;
        
        _cellState[2][8] = YES;
        _cellState[3][8] = YES;
        _cellState[7][8] = YES;
        _cellState[15][8] = YES;
        _cellState[19][8] = YES;
        _cellState[20][8] = YES;
        _cellState[2][9] = YES;
        _cellState[3][9] = YES;
        _cellState[4][9] = YES;
        _cellState[7][9] = YES;
        _cellState[15][9] = YES;
        _cellState[18][9] = YES;
        _cellState[19][9] = YES;
        _cellState[20][9] = YES;
        _cellState[2][10] = YES;
        _cellState[3][10] = YES;
        _cellState[4][10] = YES;
        _cellState[7][10] = YES;
        _cellState[15][10] = YES;
        _cellState[18][10] = YES;
        _cellState[19][10] = YES;
        _cellState[20][10] = YES;
        _cellState[1][11] = YES;
        _cellState[3][11] = YES;
        _cellState[4][11] = YES;
        _cellState[7][11] = YES;
        _cellState[15][11] = YES;
        _cellState[18][11] = YES;
        _cellState[19][11] = YES;
        _cellState[21][11] = YES;
        _cellState[1][12] = YES;
        _cellState[2][12] = YES;
        _cellState[3][12] = YES;
        _cellState[7][12] = YES;
        _cellState[15][12] = YES;
        _cellState[19][12] = YES;
        _cellState[20][12] = YES;
        _cellState[21][12] = YES;
        _cellState[2][13] = YES;
        _cellState[7][13] = YES;
        _cellState[15][13] = YES;
        _cellState[20][13] = YES;
        _cellState[7][14] = YES;
        _cellState[10][14] = YES;
        _cellState[12][14] = YES;
        _cellState[15][14] = YES;
        _cellState[7][15] = YES;
        _cellState[8][15] = YES;
        _cellState[9][15] = YES;
        _cellState[13][15] = YES;
        _cellState[14][15] = YES;
        _cellState[15][15] = YES;
    }else if (index == 2){
        _cellState[103][101] = YES;
        _cellState[101][102] = YES;
        _cellState[103][102] = YES;
        _cellState[102][104] = YES;
        _cellState[103][105] = YES;
        _cellState[103][106] = YES;
        _cellState[103][107] = YES;

    }
    
    for (NSInteger i = 0; i < CELL_NUMBER_VERTICAL; i++) {
        for (NSInteger j = 0; j < CELL_NUMBER_HORIZON; j++) {
            _cellStateDisplay[i][j] = _cellState[i][j];
        }
    }
    [self setNeedsDisplay];
}


@end
