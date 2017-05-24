//
//  ReceiveManageHeadView.m
//  SCGD
//
//  Created by 佳冬  on 2016/10/22.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "ReceiveManageHeadView.h"
#import "YZKLeftViewLabel.h"
#import "ReceiveManageDetailModel.h"
#import "NSDate+Extension.h"
#import "ProcessModel.h"
#import "AttachmentModel.h"


@interface ReceiveManageHeadView()
/**
 *  分割线
 */
@property (nonatomic, strong) UIView *topLine;
/**
 *  标题
 */
@property (nonatomic, strong) UILabel *titleView;
/**
 *  line1
 */
@property (nonatomic, strong) UIView *line1;

/**
 *  全宗号
 */
@property (nonatomic, strong) YZKLeftViewLabel *fullNumberView;
/**
 *  全宗名称
 */
@property (nonatomic, strong) YZKLeftViewLabel *fullNameView;

/**
 *  来文单位
 */
@property (nonatomic, strong) YZKLeftViewLabel *communicationsUnitsView;
/**
 *  文件编号
 */
@property (nonatomic, strong) YZKLeftViewLabel *fileNoView;

/**
 *  缓急程度
 */
@property (nonatomic, strong) YZKLeftViewLabel *degreeUrgencyView;

/**
 *  收文时间
 */
@property (nonatomic, strong) YZKLeftViewLabel *receivedTimeView;

/**
 *  登记号
 */
@property (nonatomic, strong) YZKLeftViewLabel *registrationNumberView;

/**
 *  办理期限
 */
@property (nonatomic, strong) YZKLeftViewLabel *processingPeriodView;
/**
 *  line2
 */
@property (nonatomic, strong) UIView *line2;

/**
 *  收文流程
 */
@property (nonatomic, strong) YZKLeftViewLabel *receiptProcessView;
/**
 *  line3
 */
@property (nonatomic, strong) UIView *line3;

/**
 *  文件标题
 */
@property (nonatomic, strong) YZKLeftViewLabel *fileTitleView;
/**
 *  line4
 */
@property (nonatomic, strong) UIView *line4;

/**
 *  督办
 */
@property (nonatomic, strong) YZKLeftViewLabel *supervisionView;
/**
 *  line5
 */
@property (nonatomic, strong) UIView *line5;

/**
 *  收件人
 */
@property (nonatomic, strong) YZKLeftViewLabel *recipientView;
/**
 *  line6
 */
@property (nonatomic, strong) UIView *line6;
/**
 *  附件图标
 */
@property (nonatomic, strong) UIImageView *leftIcon;
/**
 *  附件名称
 */
@property (nonatomic, strong) YZKLeftViewLabel *attachmentNameView;
/**
 *  line7
 */
@property (nonatomic, strong) UIView *line7;
@end
@implementation ReceiveManageHeadView
- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUpSubView];
    }
    return self;
}
- (void)setUpSubView
{
    
    _topLine = [[UIView alloc] init];
    _topLine.backgroundColor = lineColor;
    [self addSubview:_topLine];
    
    _titleView = [[UILabel alloc] init];
    _titleView.font = [UIFont systemFontOfSize:17];
    _titleView.textColor = fontBlackColor;
    [self addSubview:_titleView];
    _titleView.text = @" ";
    
    _line1 = [[UIView alloc] init];
    _line1.backgroundColor = lineColor;
    [self addSubview:_line1];
    
    _fullNumberView = [[YZKLeftViewLabel alloc] init];
    _fullNumberView.leftViewText = @"全宗号:";
    _fullNumberView.leftViewFont = [UIFont systemFontOfSize:15];
    _fullNumberView.leftViewColor = UIColorRGB(0xb8b8b8);
    _fullNumberView.contentViewFont = [UIFont systemFontOfSize:12];
    _fullNumberView.contentViewColor = fontBlackColor;
    [self addSubview:_fullNumberView];
    _fullNumberView.contentViewText = @" ";
    
    _fullNameView = [[YZKLeftViewLabel alloc] init];
    _fullNameView.leftViewText = @"全宗名称:";
    _fullNameView.leftViewFont = [UIFont systemFontOfSize:15];
    _fullNameView.leftViewColor = UIColorRGB(0xb8b8b8);
    _fullNameView.contentViewFont = [UIFont systemFontOfSize:15];
    _fullNameView.contentViewColor = fontBlackColor;
    [self addSubview:_fullNameView];
    _fullNameView.contentViewText = @" ";
    
    _communicationsUnitsView = [[YZKLeftViewLabel alloc] init];
    _communicationsUnitsView.leftViewText = @"来文单位:";
    _communicationsUnitsView.leftViewFont = [UIFont systemFontOfSize:15];
    _communicationsUnitsView.leftViewColor = UIColorRGB(0xb8b8b8);
    _communicationsUnitsView.contentViewFont = [UIFont systemFontOfSize:15];
    _communicationsUnitsView.contentViewColor = fontBlackColor;
    [self addSubview:_communicationsUnitsView];
    _communicationsUnitsView.contentViewText = @" ";
    
    _fileNoView = [[YZKLeftViewLabel alloc] init];
    _fileNoView.leftViewText = @"文件编号:";
    _fileNoView.leftViewFont = [UIFont systemFontOfSize:15];
    _fileNoView.leftViewColor = UIColorRGB(0xb8b8b8);
    _fileNoView.contentViewFont = [UIFont systemFontOfSize:12];
    _fileNoView.contentViewColor = fontBlackColor;
    [self addSubview:_fileNoView];
    _fileNoView.contentViewText = @" ";
    
    _degreeUrgencyView = [[YZKLeftViewLabel alloc] init];
    _degreeUrgencyView.leftViewText = @"缓急程度:";
    _degreeUrgencyView.leftViewFont = [UIFont systemFontOfSize:15];
    _degreeUrgencyView.leftViewColor = UIColorRGB(0xb8b8b8);
    _degreeUrgencyView.contentViewFont = [UIFont systemFontOfSize:15];
    _degreeUrgencyView.contentViewColor = fontBlackColor;
    [self addSubview:_degreeUrgencyView];
    _degreeUrgencyView.contentViewText = @" ";
    
    _receivedTimeView = [[YZKLeftViewLabel alloc] init];
    _receivedTimeView.leftViewText = @"收文时间:";
    _receivedTimeView.leftViewFont = [UIFont systemFontOfSize:15];
    _receivedTimeView.leftViewColor = UIColorRGB(0xb8b8b8);
    _receivedTimeView.contentViewFont = [UIFont systemFontOfSize:12];
    _receivedTimeView.contentViewColor = fontBlackColor;
    [self addSubview:_receivedTimeView];
    _receivedTimeView.contentViewText = @" ";

    _registrationNumberView = [[YZKLeftViewLabel alloc] init];
    _registrationNumberView.leftViewText = @"登记号:";
    _registrationNumberView.leftViewFont = [UIFont systemFontOfSize:15];
    _registrationNumberView.leftViewColor = UIColorRGB(0xb8b8b8);
    _registrationNumberView.contentViewFont = [UIFont systemFontOfSize:12];
    _registrationNumberView.contentViewColor = fontBlackColor;
    [self addSubview:_registrationNumberView];
    _registrationNumberView.contentViewText = @" ";
    
    _processingPeriodView = [[YZKLeftViewLabel alloc] init];
    _processingPeriodView.leftViewText = @"办理期限:";
    _processingPeriodView.leftViewFont = [UIFont systemFontOfSize:15];
    _processingPeriodView.leftViewColor = UIColorRGB(0xb8b8b8);
    _processingPeriodView.contentViewFont = [UIFont systemFontOfSize:12];
    _processingPeriodView.contentViewColor = fontBlackColor;
    [self addSubview:_processingPeriodView];
    _processingPeriodView.contentViewText = @" ";
    
    _line2 = [[UIView alloc] init];
    _line2.backgroundColor = lineColor;
    [self addSubview:_line2];
    
    _receiptProcessView = [[YZKLeftViewLabel alloc] init];
    _receiptProcessView.leftViewText = @"收文流程:";
    _receiptProcessView.leftViewFont = [UIFont systemFontOfSize:15];
    _receiptProcessView.leftViewColor = UIColorRGB(0xb8b8b8);
    _receiptProcessView.contentViewFont = [UIFont systemFontOfSize:15];
    _receiptProcessView.ContentnumberOfLines = 0;
    _receiptProcessView.contentViewColor = fontBlackColor;
    [self addSubview:_receiptProcessView];
    _receiptProcessView.contentViewText = @" ";
    
    _line3 = [[UIView alloc] init];
    _line3.backgroundColor = lineColor;
    [self addSubview:_line3];
    
    _fileTitleView = [[YZKLeftViewLabel alloc] init];
    _fileTitleView.leftViewText = @"文件标题:";
    _fileTitleView.leftViewFont = [UIFont systemFontOfSize:15];
    _fileTitleView.leftViewColor = UIColorRGB(0xb8b8b8);
    _fileTitleView.contentViewFont = [UIFont systemFontOfSize:15];
    _fileTitleView.contentViewColor = fontBlackColor;
    _fileTitleView.ContentnumberOfLines = 0;
    [self addSubview:_fileTitleView];
    _fileTitleView.contentViewText = @" ";
    
    _line4 = [[UIView alloc] init];
    _line4.backgroundColor = lineColor;
    [self addSubview:_line4];
    
    _supervisionView = [[YZKLeftViewLabel alloc] init];
    _supervisionView.leftViewText = @"督办:";
    _supervisionView.leftViewFont = [UIFont systemFontOfSize:15];
    _supervisionView.leftViewColor = UIColorRGB(0xb8b8b8);
    _supervisionView.contentViewFont = [UIFont systemFontOfSize:15];
    _supervisionView.contentViewColor = fontBlackColor;
    [self addSubview:_supervisionView];
    _supervisionView.contentViewText = @" ";
    
    _line5 = [[UIView alloc] init];
    _line5.backgroundColor = lineColor;
    [self addSubview:_line5];
    
    _recipientView = [[YZKLeftViewLabel alloc] init];
    _recipientView.leftViewText = @"收件人:";
    _recipientView.leftViewFont = [UIFont systemFontOfSize:15];
    _recipientView.leftViewColor = UIColorRGB(0xb8b8b8);
    _recipientView.contentViewFont = [UIFont systemFontOfSize:15];
    _recipientView.contentViewColor = fontBlackColor;
    [self addSubview:_recipientView];
    _recipientView.contentViewText = @" ";
    
    _line6 = [[UIView alloc] init];
    _line6.backgroundColor = lineColor;
    [self addSubview:_line6];
    
    _leftIcon = [[UIImageView alloc] init];
    _leftIcon.image = [UIImage imageNamed:@"application_accessory"];
    [self addSubview:_leftIcon];
    
    _attachmentNameView = [[YZKLeftViewLabel alloc] init];
    _attachmentNameView.leftViewText = @"附件";
    _attachmentNameView.leftViewFont = [UIFont systemFontOfSize:15];
    _attachmentNameView.leftViewColor = UIColorRGB(0xb8b8b8);
    _attachmentNameView.contentViewFont = [UIFont systemFontOfSize:15];
    _attachmentNameView.ContentnumberOfLines = 0;
    _attachmentNameView.contentViewColor = fontBlackColor;
    [self addSubview:_attachmentNameView];
    _attachmentNameView.contentViewText = @" ";
    
    _line7 = [[UIView alloc] init];
    _line7.backgroundColor = lineColor;
    [self addSubview:_line7];
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat leadding = myheight(20);
    CGFloat padding = mywidth(20);
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(leadding);
        make.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    [_line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleView.mas_bottom).offset(leadding);
        make.height.equalTo(@0.5);
        make.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    [_fullNumberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_line1.mas_bottom).offset(leadding);
        make.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    [_fullNameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_fullNumberView.mas_bottom).offset(leadding);
        make.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    [_communicationsUnitsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_fullNameView.mas_bottom).offset(leadding);
        make.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    [_fileNoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_communicationsUnitsView.mas_bottom).offset(leadding);
        make.left.equalTo(self).offset(padding);
    }];
    
    [_degreeUrgencyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_communicationsUnitsView.mas_bottom).offset(leadding);
        make.left.equalTo(_fileNoView.mas_right).offset(padding);
        make.right.equalTo(self).offset(-padding);
        make.width.equalTo(_fileNoView);
    }];
    
    [_receivedTimeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_fileNoView.mas_bottom).offset(leadding);
        make.left.equalTo(self).offset(padding);
    }];
    
    [_registrationNumberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_fileNoView.mas_bottom).offset(leadding);
        make.left.equalTo(_receivedTimeView.mas_right).offset(padding);
        make.right.equalTo(self).offset(-padding);
        make.width.equalTo(_receivedTimeView);
    }];
    
    [_processingPeriodView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_receivedTimeView.mas_bottom).offset(leadding);
        make.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    [_line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_processingPeriodView.mas_bottom).offset(leadding);
        make.height.equalTo(@0.5);
        make.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    [_receiptProcessView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_line2.mas_bottom).offset(leadding);
        make.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    [_line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_receiptProcessView.mas_bottom).offset(leadding);
        make.height.equalTo(@0.5);
        make.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    [_fileTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_line3.mas_bottom).offset(leadding);
        make.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    [_line4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_fileTitleView.mas_bottom).offset(leadding);
        make.height.equalTo(@0.5);
        make.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    [_supervisionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_line4.mas_bottom).offset(leadding);
        make.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    [_line5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_supervisionView.mas_bottom).offset(leadding);
        make.height.equalTo(@0.5);
        make.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    [_recipientView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_line5.mas_bottom).offset(leadding);
        make.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    [_line6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_recipientView.mas_bottom).offset(leadding);
        make.height.equalTo(@0.5);
        make.left.equalTo(self).offset(padding);
        make.right.equalTo(self).offset(-padding);
    }];
    
    [_attachmentNameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_line6.mas_bottom).offset(leadding);
        make.left.equalTo(_leftIcon.mas_right).offset(mywidth(5));
        make.right.equalTo(self).offset(-padding);
        make.bottom.equalTo(self).offset(-leadding);
    }];
    
    [_leftIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(padding);
        make.width.mas_equalTo(mywidth(38));
        make.height.mas_equalTo(myheight(40));
        make.top.equalTo(_line6.mas_bottom).offset(leadding);
    }];
    
    [_line7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_attachmentNameView.mas_bottom).offset(leadding);
        make.height.equalTo(@0.5);
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
    }];
    
    [_topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.height.equalTo(@0.5);
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
    }];
}
- (void)setModel:(ReceiveManageDetailModel *)model
{
    _titleView.text = [self isStringParam:model.title];
    _fullNumberView.contentViewText = [self isStringParam:model.fondsNum];
    _fullNameView.contentViewText = [self isStringParam:model.fondsName];
    _communicationsUnitsView.contentViewText = [self isStringParam:model.fileDept];
    _fileNoView.contentViewText = [self isStringParam:model.fileNum];
    _degreeUrgencyView.contentViewText = [model.urgent isEqual:@1] ? @"正常" : @"紧急";
    _receivedTimeView.contentViewText = [self isStringParam:model.receiverTime];
    _registrationNumberView.contentViewText = [self isStringParam:model.registerNum];
    _processingPeriodView.contentViewText = [self isStringParam:model.blqx];
    _receiptProcessView.contentViewText = [self isStringParam:model.approvalName];
    _fileTitleView.contentViewText = [self isStringParam:model.title];
    _supervisionView.contentViewText = [model.supervise  isEqual:@1] ? @"是" : @"否";
    _recipientView.contentViewText = [self isStringParam:model.receiverName];
    
}
- (NSString *)isStringParam:(NSString *)param
{
    return [param isKindOfClass:[NSString class]] ?param : @" ";
}
- (void)setProcessArr:(NSArray *)processArr
{
    NSMutableString *processStr = [[NSMutableString alloc] init];
    for (ProcessModel *process in processArr) {
        [processStr appendString:process.draftsName];
        if (![process isEqual:[processArr lastObject]]) {
            [processStr appendString:@"\n"];
        }
    }
    _receiptProcessView.contentViewText = processStr;
    
}

- (void)setAttachmentArr:(NSArray *)attachmentArr
{
    if (attachmentArr.count > 0) {
        NSMutableString *attachmentStr = [[NSMutableString alloc] init];
        for (AttachmentModel *attachment in attachmentArr) {
            [attachmentStr appendString:attachment.srcFileName];
            if (![attachment isEqual:[attachmentArr lastObject]]) {
                [attachmentStr appendString:@"\n"];
            }
        }
        _attachmentNameView.contentViewText = attachmentStr;
    }else
        _attachmentNameView.contentViewText = @" ";
}

@end
