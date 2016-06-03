//
//  ViewController.m
//  InfoTecquiz
//
//  Created by USER on 2016/05/04.
//  Copyright © 2016年 USER. All rights reserved.
//


#import "UIColor+FlatUI.h"
#import "UISlider+FlatUI.h"
#import "UIStepper+FlatUI.h"
#import "UITabBar+FlatUI.h"
#import "UINavigationBar+FlatUI.h"
#import "FUIButton.h"
#import "FUISwitch.h"
#import "UIFont+FlatUI.h"
#import "FUIAlertView.h"
#import "UIBarButtonItem+FlatUI.h"
#import "UIProgressView+FlatUI.h"
#import "FUISegmentedControl.h"
#import "UIPopoverController+FlatUI.h"
#import "NSString+Icons.h"
//#import "FUIAlertQuizView.h"

#import "InitViewController.h"
#import "CPTGraphHostingMainView.h"
#import "QuizListTableViewController.h"

@interface QuizList : NSObject
- (void)method;
@end

@implementation QuizList


@end

//---------------------------------
@interface InitViewController ()

@property (weak, nonatomic) IBOutlet FUIButton *alertViewButton;

@property (strong, nonatomic) CPTGraphHostingMainView *uiView;

@end

@implementation InitViewController
//{
//    CPTGraphHostingMainView *uiView;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"情報処理試験";
    self.view.backgroundColor = [UIColor cloudsColor];
//    NSDictionary *attrs = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
//    [[UIBarItem appearance] setTitleTextAttributes:attrs
//                                          forState:UIControlStateNormal];
//    [UIBarButtonItem configureFlatButtonsWithColor:[UIColor peterRiverColor]
//                                  highlightedColor:[UIColor belizeHoleColor]
//                                      cornerRadius:3
//                                   whenContainedIn:[UINavigationBar class], nil];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"一覧"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(showPlainTableView:)];
    
    [self.navigationItem.rightBarButtonItem configureFlatButtonWithColor:[UIColor peterRiverColor]//colorWithRed:0.035 green:0.918 blue:0.910 alpha:1.0]
                                                       highlightedColor:[UIColor belizeHoleColor]
                                                           cornerRadius:3];
    [self.navigationItem.rightBarButtonItem removeTitleShadow];
    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Grouped Table"
//                                                                             style:UIBarButtonItemStylePlain
//                                                                            target:self
//                                                                            action:@selector(showTableView:)];
//    [self.navigationItem.leftBarButtonItem removeTitleShadow];
//    
//    [self.navigationItem.leftBarButtonItem configureFlatButtonWithColor:[UIColor alizarinColor]
//                                                       highlightedColor:[UIColor pomegranateColor]
//                                                           cornerRadius:3];
    
    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:[UIColor midnightBlueColor]];
    
    
    
    self.alertViewButton.buttonColor = [UIColor turquoiseColor];
    self.alertViewButton.shadowColor = [UIColor greenSeaColor];
    self.alertViewButton.shadowHeight = 3.0f;
    self.alertViewButton.cornerRadius = 6.0f;
    self.alertViewButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [self.alertViewButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.alertViewButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    
    _uiView = [[CPTGraphHostingMainView alloc] initWithFrame:CGRectMake(0, 200, 320, 460)];
    
    [self.view addSubview:_uiView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlertView:(id)sender {
    
    [self showQuiz];
    
    [_uiView testPolt];
    
 
    
//    [CPTGraphHostingMainView testplot];
//    CPTGraphHostingMainView.testPlo
//    
//    CPTGraphHostingMainView = [[CPTGraphHostingMainView alloc] initWithFrame
//                         
//
//    CPTGraphHostingMainView init
}

- (void)showQuiz{
    
    
    FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle4:@"第1問" message:@"数値を2進数で格納するレジスタがある。このレジスタに正の整数xを設定した後，レジスタの値を2ビット左にシフトして，xを加える操作を行うと，レジスタの値はxの何倍になるか。ここで，あふれ(オーバフロー)は，発生しないものとする。"
                               delegate:nil
                               cancelButtonTitle:@"aa"
                               otherButtonTitles1:@"3"
                               otherButtonTitles2:@"4"
                               otherButtonTitles3:@"5"
                               otherButtonTitles4:@"6"
                               , nil];
    alertView.alertViewStyle = FUIAlertViewStylePlainTextInput;
    
    
    
//    [@[[alertView textFieldAtIndex:0], [alertView textFieldAtIndex:1]] enumerateObjectsUsingBlock:^(FUITextField *textField, NSUInteger idx, BOOL *stop) {
//        [textField setTextFieldColor:[UIColor cloudsColor]];
//        [textField setBorderColor:[UIColor asbestosColor]];
//        [textField setCornerRadius:4];
//        [textField setFont:[UIFont flatFontOfSize:14]];
//        [textField setTextColor:[UIColor midnightBlueColor]];
//    }];
//    [[alertView textFieldAtIndex:0] setPlaceholder:@"Text here!"];
 
    
    
    //ここをコメントアウト
    alertView.delegate = self;
//    alertView.titleLabel.textColor = [UIColor cloudsColor];
    alertView.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    alertView.messageLabel.textColor = [UIColor cloudsColor];
    alertView.messageLabel.font = [UIFont flatFontOfSize:14];
    alertView.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
    alertView.alertContainer.backgroundColor = [UIColor midnightBlueColor];
    alertView.defaultButtonColor = [UIColor cloudsColor];
    alertView.defaultButtonShadowColor = [UIColor asbestosColor];
    alertView.defaultButtonFont = [UIFont boldFlatFontOfSize:16];
    alertView.defaultButtonTitleColor = [UIColor asbestosColor];
    [alertView show];
    
}


- (void)showPlainTableView:(id)sender {
    QuizListTableViewController* tableViewController = [[QuizListTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:tableViewController animated:YES];
}



//--------------------------------------------------------------------------
//グラフ用
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------


@end
