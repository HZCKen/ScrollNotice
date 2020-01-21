//
//  HZCScrollNoticeView.h
//  HZCScrollNoticeView
//
//  Created by Apple on 2020/1/20.
//  Copyright © 2020 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class HZCScrollNoticeTableViewCell;
@class HZCScrollNoticeView;

@protocol HZCScrollNoticeViewDelegate <NSObject>

- (void)noticeView:(HZCScrollNoticeView *)noticeView configCell:(HZCScrollNoticeTableViewCell *)cell data:(id)data;
- (void)noticeView:(HZCScrollNoticeView *)noticeView didSelectIndexPath:(NSIndexPath *)indexPath;


@end

@interface HZCScrollNoticeView : UIView

/** <#Description#> */
@property (nonatomic, strong) NSArray *datas;

/** delegate */
@property (nonatomic, weak) id<HZCScrollNoticeViewDelegate> delegate;

/** <#Description#> */
@property (nonatomic, copy) void (^configCell)(HZCScrollNoticeTableViewCell *cell, id data);

/** <#Description#> */
@property (nonatomic, copy) void (^didSelect)(NSIndexPath *indexPath);

- (void)registerClass:(nullable Class)cellClass forCellReuseIdentifier:(NSString *)identifier;
- (void)registerNib:(nullable UINib *)nib forCellReuseIdentifier:(NSString *)identifier;

- (void)startScroll;
- (void)stopScroll;

@end


NS_ASSUME_NONNULL_END
