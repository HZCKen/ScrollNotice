//
//  HZCScrollNoticeView.m
//  HZCScrollNoticeView
//
//  Created by Apple on 2020/1/20.
//  Copyright © 2020 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "HZCScrollNoticeView.h"
#import "HZCScrollNoticeTableViewCell.h"

@interface HZCScrollNoticeView ()<UITableViewDelegate, UITableViewDataSource>

/** <#Description#> */
@property (nonatomic, strong) UITableView *tableView;
/** <#Description#> */
@property (nonatomic, strong) NSTimer *timer;
/** <#Description#> */
@property (nonatomic, assign) NSInteger index;
/** <#Description#> */
@property (nonatomic, copy) NSString *cellIdentifier;
@end

@implementation HZCScrollNoticeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        [self initData];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupUI];
        [self initData];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.tableView];
}

- (void)initData {
    self.stayInterval = 1;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height-1;
    self.tableView.frame = CGRectMake(0, 0, w, h);
    // UITableViewCellSeparatorStyleNone 在使用约束的时候 在layoutSubviews 才生效
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

}

- (void)registerClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier {
    [self.tableView registerClass:cellClass forCellReuseIdentifier:identifier];
    self.cellIdentifier = identifier;
}

- (void)registerNib:(UINib *)nib forCellReuseIdentifier:(NSString *)identifier {
    [self.tableView registerNib:nib forCellReuseIdentifier:identifier];
    self.cellIdentifier = identifier;
}

- (void)startScroll {
    if (self.timer == nil) {
        self.index = 0;
        self.timer = [NSTimer timerWithTimeInterval:self.stayInterval target:self selector:@selector(startScroll) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:(NSRunLoopCommonModes)];
    }
    if (self.index < self.datas.count - 1) {
        self.index += 1;
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.index inSection:0] atScrollPosition:(UITableViewScrollPositionBottom) animated:YES];
    } else if (self.index == self.datas.count - 1) {
        self.index = 0;
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:(UITableViewScrollPositionBottom) animated:YES];
    }
}

- (void)stopScroll {
    [self.timer invalidate];
    self.timer = nil;
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = [HZCScrollNoticeTableViewCell cellIdentifier];
    
    if (self.cellIdentifier.length > 0) {
        identifier = self.cellIdentifier;
    }
    
    HZCScrollNoticeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];    
    if ([self.delegate respondsToSelector:@selector(noticeView:configCell:data:)]) {
        [self.delegate noticeView:self configCell:cell data:self.datas[indexPath.row]];
    } else if (self.configCell) {
        self.configCell(cell, self.datas[indexPath.row]);
    } else {
        id title = self.datas[indexPath.row];
        if ([title isKindOfClass:[NSString class]]) {
            [cell setTitle:title];
        }
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __FUNCTION__);

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.delegate respondsToSelector:@selector(noticeView:didSelectIndexPath:)]) {
        [self.delegate noticeView:self didSelectIndexPath:indexPath];
    } else if (self.didSelect) {
        self.didSelect(indexPath);
    }
}



- (void)setDatas:(NSArray *)datas {
    _datas = datas;
}


- (UITableView *)tableView {
    if (_tableView == nil) {
        CGFloat w = self.frame.size.width;
        CGFloat h = self.frame.size.height-1;
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, w, h) style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollEnabled = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _tableView.pagingEnabled = YES;
        [_tableView registerClass:[HZCScrollNoticeTableViewCell class] forCellReuseIdentifier:[HZCScrollNoticeTableViewCell cellIdentifier]];
    }
    return _tableView;
}

@end
