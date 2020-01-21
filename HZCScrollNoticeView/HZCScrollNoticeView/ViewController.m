//
//  ViewController.m
//  HZCScrollNoticeView
//
//  Created by Apple on 2020/1/20.
//  Copyright © 2020 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "ViewController.h"
#import "HZCScrollNoticeView.h"
#import "Demo1Cell.h"
#import "Demo2Cell.h"

@interface ViewController ()<HZCScrollNoticeViewDelegate>
/** <#Description#> */
@property (nonatomic, strong) NSArray *arr1;
@property (weak, nonatomic) IBOutlet HZCScrollNoticeView *noticeView4;

/** <#Description#> */
@property (nonatomic, strong) HZCScrollNoticeView *noticeView;
/** <#Description#> */
@property (nonatomic, strong) HZCScrollNoticeView *noticeView3;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.arr1 = @[@"小米千元全面屏：抱歉，久等！625献上",
              @"可怜狗狗被抛弃，苦苦等候主人半年",
              @"三星中端新机改名，全面屏火力全开",
              @"学会这些，这5种花不用去花店买了",
              @"华为nova2S发布，剧透了荣耀10？"
    ];
    
    NSArray *arr2 = @[
           @{@"arr": @[@{@"tag": @"手机", @"title": @"小米千元全面屏：抱歉，久等！625献上"}, @{@"tag": @"萌宠", @"title": @"可怜狗狗被抛弃，苦苦等候主人半年"}], @"img": @"tb_icon2"},
           @{@"arr": @[@{@"tag": @"手机", @"title": @"三星中端新机改名，全面屏火力全开"}, @{@"tag": @"围观", @"title": @"主人假装离去，狗狗直接把孩子推回去了"}], @"img": @"tb_icon3"},
           @{@"arr": @[@{@"tag": @"园艺", @"title": @"学会这些，这5种花不用去花店买了"}, @{@"tag": @"手机", @"title": @"华为nova2S发布，剧透了荣耀10？"}], @"img": @"tb_icon5"},
           @{@"arr": @[@{@"tag": @"开发", @"title": @"iOS 内购最新讲解"}, @{@"tag": @"博客", @"title": @"技术博客那些事儿"}], @"img": @"tb_icon6"},
           @{@"arr": @[@{@"tag": @"招聘", @"title": @"招聘XX高级开发工程师"}, @{@"tag": @"资讯", @"title": @"如何写一篇好的技术博客"}], @"img": @"tb_icon7"}
       ];
    
    
    NSLog(@"viewDidLoad %ld", self.arr1.count);
    self.noticeView4.stayInterval = 3;
    self.noticeView4.datas = self.arr1;
//    self.noticeView4.backgroundColor = [UIColor redColor];
    
//    // 默认
    self.noticeView = [[HZCScrollNoticeView alloc]init];
//    self.noticeView.backgroundColor = [UIColor redColor];
    self.noticeView.frame = CGRectMake(0, 100, 375, 40);
    self.noticeView.datas = self.arr1;
//    self.noticeView.delegate = self;
    [self.view addSubview:self.noticeView];
//    // 使用自定义cell 必须继承 HZCScrollNoticeTableViewCell
//    // 自定义cell
//    HZCScrollNoticeView *noticeView2 = [[HZCScrollNoticeView alloc]init];
//    noticeView2.frame = CGRectMake(0, 150, 375, 40);
//    [noticeView2 registerClass:[Demo1Cell class] forCellReuseIdentifier:[Demo1Cell cellIdentifier]];
//    noticeView2.datas = self.arr1;
//    [self.view addSubview:noticeView2];
//    [noticeView2 startScroll];
//    
//    // 自定义cell xib
//    HZCScrollNoticeView *noticeView3 = [[HZCScrollNoticeView alloc]init];
//    noticeView3.frame = CGRectMake(0, 200, 375, 100);
//    [noticeView3 registerNib:[UINib nibWithNibName:[Demo2Cell cellIdentifier] bundle:nil] forCellReuseIdentifier:[Demo2Cell cellIdentifier]];
//    [self.noticeView3 stopScroll];
//    noticeView3.datas = arr2;
//    self.noticeView3 = noticeView3;
////    self.noticeView3.delegate = self;
//    [self.noticeView3 startScroll];
//    [self.noticeView3 setConfigCell:^(HZCScrollNoticeTableViewCell * _Nonnull cell, id  _Nonnull data) {
//        Demo2Cell *demo2Cell = (Demo2Cell *)cell;
//        NSDictionary *dict = (NSDictionary *)data;
//        demo2Cell.label1.text = [dict[@"arr"] firstObject][@"title"];
//        demo2Cell.label2.text = [dict[@"arr"] lastObject][@"title"];
//    }];
//    
//    [self.view addSubview:noticeView3];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.noticeView startScroll];
    [self.noticeView4 startScroll];
}

- (void)noticeView:(HZCScrollNoticeView *)noticeView configCell:(HZCScrollNoticeTableViewCell *)cell data:(id)data {
    if (noticeView == self.noticeView3) {
        if ([cell isKindOfClass:[Demo2Cell class]]) {
            
            Demo2Cell *demo2Cell = (Demo2Cell *)cell;
            NSDictionary *dict = (NSDictionary *)data;
            demo2Cell.label1.text = [dict[@"arr"] firstObject][@"title"];
            demo2Cell.label2.text = [dict[@"arr"] lastObject][@"title"];
            
        }
    }
    if (noticeView == self.noticeView) {
        [cell setTitle:data];
    }
}

- (void)noticeView:(HZCScrollNoticeView *)noticeView didSelectIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"delegate %@", self.arr1[indexPath.row]);
    
}


@end
