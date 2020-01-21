//
//  HZCScrollNoticeTableViewCell.m
//  HZCScrollNoticeView
//
//  Created by Apple on 2020/1/20.
//  Copyright © 2020 AiChen smart Windows and doors technology co., LTD. All rights reserved.
//

#import "HZCScrollNoticeTableViewCell.h"

@interface HZCScrollNoticeTableViewCell ()

/** <#Description#> */
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation HZCScrollNoticeTableViewCell

+ (NSString *)cellIdentifier {
    return [self description];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setupUI];
}

- (void)setupUI {
    [self.contentView addSubview:self.titleLabel];
}


- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
}


- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.numberOfLines = 1;
        _titleLabel.frame = CGRectMake(20, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
    }
    return _titleLabel;
}

@end
