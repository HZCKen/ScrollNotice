//
//  HZCScrollNoticeTableViewCell.h
//  HZCScrollNoticeView
//
//  Created by Apple on 2020/1/20.
//  Copyright © 2020 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZCScrollNoticeTableViewCell : UITableViewCell

+ (NSString *)cellIdentifier;

- (void)setTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
