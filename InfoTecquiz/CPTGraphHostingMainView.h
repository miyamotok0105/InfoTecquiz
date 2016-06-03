//
//  CPTGraphHostingMainView.h
//  InfoTecquiz
//
//  Created by USER on 2016/05/29.
//  Copyright © 2016年 USER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"

@interface CPTGraphHostingMainView : UIView<CPTPieChartDataSource,CPTPieChartDelegate
,CPTPlotDataSource,CPTPlotSpaceDelegate>


@property(nonatomic, strong) CPTXYGraph *barChart;


@property (nonatomic) NSInteger *colIndex;

-(void)testPolt;


@end
