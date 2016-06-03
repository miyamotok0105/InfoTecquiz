//
//  CPTGraphHostingMainView.m
//  InfoTecquiz
//
//  Created by USER on 2016/05/29.
//  Copyright © 2016年 USER. All rights reserved.
//

#import "CPTGraphHostingMainView.h"

@implementation CPTGraphHostingMainView
{
    NSMutableArray *reloadData;
    CPTGraphHostingView *hostingView;
    NSInteger addIndexQuiz;
    NSMutableArray *addIndexQuizData;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//- (id)initWithCoder:(NSCoder *)aDecoder
//{
//    self = [super initWithCoder:aDecoder];
//    if(self){
//        
//        
//        [self setInitGraph];
//        
//        reloadData = [NSMutableArray arrayWithObjects:
//                      [NSNumber numberWithInteger:40],
//                      [NSNumber numberWithInteger:30],
//                      [NSNumber numberWithInteger:20],
//                      [NSNumber numberWithInteger:10],
//                      [NSNumber numberWithInteger:10],
//                      nil];
//       // [self testPolt];
//        
////        [self myInit];
//    }
//    return self;
//}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        addIndexQuiz = 1;
        addIndexQuizData = [NSMutableArray arrayWithObjects:
                            [NSString stringWithFormat:@"%ld問目",addIndexQuiz],
                            [NSString stringWithFormat:@"%ld問目",addIndexQuiz+1],
                            [NSString stringWithFormat:@"%ld問目",addIndexQuiz+2],
                            [NSString stringWithFormat:@"%ld問目",addIndexQuiz+3],
                            [NSString stringWithFormat:@"%ld問目",addIndexQuiz+4],
                            nil];
        
        reloadData = [NSMutableArray arrayWithObjects:
                        [NSNumber numberWithInteger:40],
                        [NSNumber numberWithInteger:30],
                        [NSNumber numberWithInteger:20],
                        [NSNumber numberWithInteger:10],
                        [NSNumber numberWithInteger:10],
                        nil];
      
        [self setInitGraph];
    }
    return self;
}

//- (id)initWithFrame
//{
////    self = [super initWithCoder:aDecoder];
////    if(self){
//    
//    
//        reloadData = [NSMutableArray arrayWithObjects:
//                  [NSNumber numberWithInteger:40],
//                  [NSNumber numberWithInteger:30],
//                  [NSNumber numberWithInteger:20],
//                  [NSNumber numberWithInteger:10],
//                  [NSNumber numberWithInteger:10],
//                  nil];
//    
//        [self setInitGraph];
//    
//        // [self testPolt];
//        
//        //        [self myInit];
////    }
//    return self;
//}

-(void)setInitGraph
{
    //ホスティングビューの作成
    hostingView =
    [[CPTGraphHostingView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    // 画面にホスティングビューを追加
//    [self.view addSubview:hostingView];
    [self addSubview:hostingView];
    
    // グラフのテーマをセット
    self.barChart = [[CPTXYGraph alloc] initWithFrame:CGRectZero];
    CPTTheme *theme = [CPTTheme themeNamed:kCPTDarkGradientTheme
                       ];
    [self.barChart applyTheme:theme];
    hostingView.hostedGraph = self.barChart;
    
    // ボーダー設定------------------------------------------------------
    self.barChart.plotAreaFrame.borderLineStyle = nil;
    self.barChart.plotAreaFrame.cornerRadius    = 0.0f;
    // Paddings----------------------------------------------------
    self.barChart.paddingLeft   = 0.0f;
    self.barChart.paddingRight  = 0.0f;
    self.barChart.paddingTop    = 0.0f;
    self.barChart.paddingBottom = 0.0f;
    
    self.barChart.plotAreaFrame.paddingLeft   = 60.0f;
    self.barChart.plotAreaFrame.paddingTop    = 60.0f;
    self.barChart.plotAreaFrame.paddingRight  = 20.0f;
    self.barChart.plotAreaFrame.paddingBottom = 95.0f;
    
    // テキストスタイル
    CPTMutableTextStyle *textStyle = [CPTTextStyle textStyle];
    textStyle.color                = [CPTColor colorWithComponentRed:0.447f green:0.443f blue:0.443f alpha:1.0f];
    textStyle.fontSize             = 13.0f;
    textStyle.textAlignment        = CPTTextAlignmentCenter;
    
    // ラインスタイル
    CPTMutableLineStyle *lineStyle = [CPTMutableLineStyle lineStyle];
    lineStyle.lineColor            = [CPTColor colorWithComponentRed:0.788f green:0.792f blue:0.792f alpha:1.0f];
    lineStyle.lineWidth            = 2.0f;
    
    //プロット間隔の設定
    CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *)self.barChart.defaultPlotSpace;
    plotSpace.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInt(0) length:CPTDecimalFromInt(100)]; //0〜10回のY軸を作る
    
    plotSpace.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInt(0) length:CPTDecimalFromInt(5)];
    
    // X軸のメモリ・ラベルなどの設定
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *)self.barChart.axisSet;
    CPTXYAxis *x          = axisSet.xAxis;
    
    x.axisLineStyle               = lineStyle;
    x.majorTickLineStyle          = lineStyle;
    x.minorTickLineStyle          = lineStyle;
    x.majorIntervalLength         = CPTDecimalFromString(@"10");
    x.orthogonalCoordinateDecimal = CPTDecimalFromString(@"0");
    x.title                       = @"スコア";
    x.titleTextStyle = textStyle;
    x.titleLocation               = CPTDecimalFromFloat(5.0f);
    x.titleOffset                 = 36.0f;
    x.minorTickLength = 5.0f;
    x.majorTickLength = 9.0f;
    x.labelRotation  = M_PI / 4; // 表示角度
    x.labelTextStyle = textStyle;
    
    //X軸のラベル名（）
    NSMutableArray *labels = [NSMutableArray arrayWithCapacity:3];
    float idx = 0.5;
    
    for(int i=0; i<5; i++)
    {
        CPTAxisLabel *label;
        
        
        if(i==0){
            
            CPTMutableTextStyle *axisTitleStyle = [CPTMutableTextStyle textStyle];
            axisTitleStyle.color = [CPTColor whiteColor];
            axisTitleStyle.fontName = @"Helvetica-Bold";
            axisTitleStyle.fontSize = 12.0f;

            label = [[CPTAxisLabel alloc] initWithText:[addIndexQuizData objectAtIndex:i]
                                             textStyle:axisTitleStyle];

        }
        else{
            label = [[CPTAxisLabel alloc] initWithText:[addIndexQuizData objectAtIndex:i]
                                                           textStyle:axisSet.xAxis.labelTextStyle];
            
            
        }
        
        label.tickLocation = CPTDecimalFromFloat(idx); // ラベルを追加するレコードの位置
        label.offset = 5.0f; // 軸からラベルまでの距離
        [labels addObject:label];
        ++idx;
        
    }
    addIndexQuiz = addIndexQuiz + 1;    //1問ずらす
    
//    for (NSString *year in @[@"1問目",@"2問目",@"3問目",@"4問目",@"5問目"]) // ラベルの文字列
//    {
//        CPTAxisLabel *label = [[CPTAxisLabel alloc] initWithText:year
//                                                       textStyle:axisSet.xAxis.labelTextStyle];
//        label.tickLocation = CPTDecimalFromFloat(idx); // ラベルを追加するレコードの位置
//        label.offset = 5.0f; // 軸からラベルまでの距離
//        [labels addObject:label];
//        ++idx;
//    }
    // X軸に設定
    x.axisLabels = [NSSet setWithArray:labels];
    x.labelingPolicy = CPTAxisLabelingPolicyNone;
    
    
    
    // Y軸のメモリ・ラベルなどの設定
    CPTXYAxis *y = axisSet.yAxis;
    
    y.axisLineStyle               = lineStyle;
    y.minorTickLength = 5.0f;
    y.majorTickLength = 10.0f;
    y.majorTickLineStyle          = lineStyle;
    y.minorTickLineStyle          = lineStyle;
    y.majorIntervalLength         = CPTDecimalFromFloat(10.0f); //１メモリあたりの点数
    y.orthogonalCoordinateDecimal = CPTDecimalFromFloat(0.0f);
    
    y.title                       = @"正解";
    y.titleTextStyle = textStyle;
    y.titleRotation = M_PI*2;
    y.titleLocation               = CPTDecimalFromFloat(45.0f);
    y.titleOffset                 = 28.0f;
    lineStyle.lineWidth = 0.8f;
    y.majorGridLineStyle = lineStyle;
    y.labelTextStyle = textStyle;
    
    // バー表示設定
    CPTBarPlot *barPlot = [CPTBarPlot tubularBarPlotWithColor:[CPTColor colorWithComponentRed:1.0f green:1.0f blue:0.88f alpha:1.0f] horizontalBars:NO];
    
    barPlot.fill = [CPTFill fillWithColor:[CPTColor colorWithComponentRed:0.573f green:0.82f blue:0.831f alpha:0.50f]];
    
    barPlot.lineStyle = lineStyle;
    barPlot.baseValue  = CPTDecimalFromString(@"0");
    barPlot.dataSource = self;
    barPlot.barWidth = CPTDecimalFromFloat(0.5f);
    barPlot.barOffset  = CPTDecimalFromFloat(0.5f);
    [self.barChart addPlot:barPlot toPlotSpace:plotSpace];

}

-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot
{
    return 5;
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index
{
    NSDecimalNumber *num = nil;
    
    if ( [plot isKindOfClass:[CPTBarPlot class]] ) {
        
        switch ( fieldEnum ) {
                //X方向の位置を指定
            case CPTBarPlotFieldBarLocation:
                num = (NSDecimalNumber *)[NSDecimalNumber numberWithUnsignedInteger:index];
                break;
                
                //棒の高さを指定
            case CPTBarPlotFieldBarTip:
//                if(index == 0){
//                    num = (NSDecimalNumber *)[NSDecimalNumber numberWithUnsignedInteger:80];
//                }else if(index == 1){
//                    num = (NSDecimalNumber *)[NSDecimalNumber numberWithUnsignedInteger:30];
//                }else if(index == 2){
//                    num = (NSDecimalNumber *)[NSDecimalNumber numberWithUnsignedInteger:20];
//                }else if(index == 3){
//                    num = (NSDecimalNumber *)[NSDecimalNumber numberWithUnsignedInteger:60];
//                }else if(index == 4){
//                    num = (NSDecimalNumber *)[NSDecimalNumber numberWithUnsignedInteger:45];
//                }
                if(index == 0){
                    num = (NSDecimalNumber *)[NSDecimalNumber numberWithInteger:[[reloadData objectAtIndex:index] integerValue]];
                }else if(index == 1){
                    num = (NSDecimalNumber *)[NSDecimalNumber numberWithInteger:[[reloadData objectAtIndex:index] integerValue]];
                }else if(index == 2){
                    num = (NSDecimalNumber *)[NSDecimalNumber numberWithInteger:[[reloadData objectAtIndex:index] integerValue]];
                }else if(index == 3){
                    num = (NSDecimalNumber *)[NSDecimalNumber numberWithInteger:[[reloadData objectAtIndex:index] integerValue]];
                }else if(index == 4){
                    num = (NSDecimalNumber *)[NSDecimalNumber numberWithInteger:[[reloadData objectAtIndex:index] integerValue]];
                }
                break;
        }
    }
    return num;
}


-(void)testPolt{
    
    addIndexQuizData = [NSMutableArray arrayWithObjects:
                        [NSString stringWithFormat:@"%ld問目",addIndexQuiz],
                        [NSString stringWithFormat:@"%ld問目",addIndexQuiz+1],
                        [NSString stringWithFormat:@"%ld問目",addIndexQuiz+2],
                        [NSString stringWithFormat:@"%ld問目",addIndexQuiz+3],
                        [NSString stringWithFormat:@"%ld問目",addIndexQuiz+4],
                        nil];
    
    reloadData = [NSMutableArray arrayWithObjects:
                  [NSNumber numberWithInteger:arc4random() % 100],
                  [NSNumber numberWithInteger:arc4random() % 100],
                  [NSNumber numberWithInteger:arc4random() % 100],
                  [NSNumber numberWithInteger:arc4random() % 100],
                  [NSNumber numberWithInteger:arc4random() % 100],
                  nil];
    
    [self setInitGraph];
    
//    // X軸のメモリ・ラベルなどの設定
//    CPTXYAxisSet *axisSet = (CPTXYAxisSet *)self.barChart.axisSet;
//    CPTXYAxis *x          = axisSet.xAxis;
//    
//    NSMutableArray *labels = [NSMutableArray arrayWithCapacity:3];
//    float idx = 0.5;
//    for (NSString *year in @[@"6問目",@"7問目",@"8問目",@"9問目",@"10問目"]) // ラベルの文字列
//    {
//        CPTAxisLabel *label = [[CPTAxisLabel alloc] initWithText:year
//                                                       textStyle:axisSet.xAxis.labelTextStyle];
//        label.tickLocation = CPTDecimalFromFloat(idx); // ラベルを追加するレコードの位置
//        label.offset = 5.0f; // 軸からラベルまでの距離
//        [labels addObject:label];
//        ++idx;
//    }
//    // X軸に設定
//    x.axisLabels = [NSSet setWithArray:labels];
//    
//    // バー表示設定
//    CPTBarPlot *barPlot = [CPTBarPlot tubularBarPlotWithColor:[CPTColor colorWithComponentRed:1.0f green:1.0f blue:0.88f alpha:1.0f] horizontalBars:NO];
//    
//    barPlot.fill = [CPTFill fillWithColor:[CPTColor colorWithComponentRed:0.573f green:0.82f blue:0.831f alpha:0.50f]];
//    
////    barPlot.lineStyle = lineStyle;
//    barPlot.baseValue  = CPTDecimalFromString(@"0");
//    barPlot.dataSource = self;
//    barPlot.barWidth = CPTDecimalFromFloat(0.5f);
//    barPlot.barOffset  = CPTDecimalFromFloat(0.5f);
////    [self.barChart addPlot:barPlot toPlotSpace:plotSpace];
//
//    self.barChart = nil;
//    
//    // グラフのテーマをセット
//    self.barChart = [[CPTXYGraph alloc] initWithFrame:CGRectZero];
//    CPTTheme *theme = [CPTTheme themeNamed:kCPTDarkGradientTheme
//                       ];
//    [self.barChart applyTheme:theme];
//    [self.barChart addPlot:barPlot];
//    hostingView.hostedGraph = self.barChart;
    
    
}



@end
