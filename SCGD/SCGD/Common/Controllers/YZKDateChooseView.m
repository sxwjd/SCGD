//
//  YZKDateChooseView.m
//  SCGD
//
//  Created by Lizeyu on 16/10/24.
//  Copyright © 2016年 YZK. All rights reserved.
//

#import "YZKDateChooseView.h"

static const NSInteger minYear = 2008;
static const NSInteger maxYear = 2030;

@interface YZKDateChooseView() <UIGestureRecognizerDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSString *_thisYear;
    NSString *_thisMonth;
    NSString *_thisDay;
    NSArray *_months;
    NSArray *_years;
    NSArray *_days;
    NSString *_selectedYear;
    NSString *_selectedMonth;
    NSString *_selectedDay;
    
}
@property (nonatomic, strong) UIImageView *bgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *topLineView;
@property (nonatomic, strong) UIView *bottomLineView;
@property (nonatomic, strong) UIButton *sureBtn;
@property (nonatomic, strong) UIPickerView *datePicker;
@property (nonatomic, strong) UIView *boxTopLineView;
@property (nonatomic, strong) UIView *boxBottomLineView;


@end

@implementation YZKDateChooseView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
        [self setupUI];
        [self getDate];
        _months = [self Months];
        _years = [self Years];
        _days = [self Days];
        [self.datePicker selectRow:[_months indexOfObject:_thisMonth] inComponent:2 animated:YES];
        _selectedMonth = _thisMonth;
        [self.datePicker selectRow:[_years indexOfObject:_thisYear] inComponent:0 animated:YES];
        _selectedYear = _thisYear;
        _selectedDay = _thisDay;
    }
    return self;
}

#pragma mark - UIPickerView Delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return !_showDay ? 4 : 6;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 1 || component == 3 || component == 5) {
        return 1;
    }else if(component == 0){
        return _years.count;
    }else if(component == 2){
        return _months.count;
    }else{
        return _days.count;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    if (component == 1 || component == 3 || component == 5) {
        return mywidth(70);
    }else if (component == 2 || component == 4){
        return mywidth(90);
    }else{
        return mywidth(150);
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return myheight(88);
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    [[pickerView.subviews objectAtIndex:1] setHidden:TRUE];
    [[pickerView.subviews objectAtIndex:2] setHidden:TRUE];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithCapacity:0];
    params[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    params[NSForegroundColorAttributeName] = UIColorRGB(0x56abe4);
    if (component == 1) {
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"年" attributes:params];
        return attrString;
    }else if (component == 3) {
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"月" attributes:params];
        return attrString;
    }else if (component == 0) {
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",_years[row]] attributes:params];
        return attrString;
    }else if(component == 2){
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",_months[row]] attributes:params];
        return attrString;
    }else if (component == 5){
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"日"] attributes:params];
        return attrString;
    }else{
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@",_days[row]] attributes:params];
        return attrString;
    }
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        _selectedYear = [_years objectAtIndex:row];
    }else if(component == 2){
        _selectedMonth = [_months objectAtIndex:row];
    }else if (component == 4){
        _selectedDay = [_days objectAtIndex:row];
    }
}



#pragma mark - UIGestureDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view isKindOfClass:[UIImageView class]]) {
        return NO;
    }else
    {
        return YES;
    }
}

#pragma mark - private methos

- (void)setupUI{
    _bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_bgview"]];
    _bgView.userInteractionEnabled = YES;
    [self addSubview:_bgView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = UIColorRGB(0x56abe4);
    _titleLabel.font = [UIFont systemFontOfSize:16];
    _titleLabel.text = @"设置日期";
    [self.bgView addSubview:_titleLabel];
    
    _topLineView = [[UIView alloc] init];
    _topLineView.backgroundColor = UIColorRGB(0x56abe4);
    _topLineView.layer.masksToBounds = YES;
    [self.bgView addSubview:_topLineView];
    
    _datePicker = [[UIPickerView alloc] init];
    _datePicker.delegate = self;
    _datePicker.dataSource = self;
    _datePicker.tintColor = UIColorRGB(0x56abe4);
    [self.bgView addSubview:_datePicker];
    
    _bottomLineView = [[UIView alloc] init];
    _bottomLineView.backgroundColor = UIColorRGB(0x56abe4);
    _bottomLineView.layer.masksToBounds = YES;
    [self.bgView addSubview:_bottomLineView];
    
    _boxTopLineView = [[UIView alloc] init];
    _boxTopLineView.backgroundColor = UIColorRGB(0x56abe4);
    [self.bgView addSubview:_boxTopLineView];
    
    _boxBottomLineView = [[UIView alloc] init];
    _boxBottomLineView.backgroundColor = UIColorRGB(0x56abe4);
    [self.bgView addSubview:_boxBottomLineView];
    
    _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_sureBtn setTitle:@"完成" forState:UIControlStateNormal];
    _sureBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [_sureBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_sureBtn addTarget:self action:@selector(sureBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:_sureBtn];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
    
}

- (void)getDate{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    _thisYear = [[formatter stringFromDate:[NSDate date]] componentsSeparatedByString:@"-"][0];
    _thisMonth = [[formatter stringFromDate:[NSDate date]] componentsSeparatedByString:@"-"][1];
    _thisDay = [[formatter stringFromDate:[NSDate date]] componentsSeparatedByString:@"-"][2];
}

- (NSArray *)Days{
    NSArray *months = @[@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31"];
    return months;
}

-(NSArray *)Months
{
    NSArray *months = @[@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12"];
    return months;
}

-(NSArray *)Years
{
    NSMutableArray *years = [NSMutableArray array];
    
    for(NSInteger year = minYear; year <= maxYear; year++)
    {
        NSString *yearStr = [NSString stringWithFormat:@"%li", (long)year];
        [years addObject:yearStr];
    }
    return years;
}

- (void)dismiss{
    NSString *date = [NSString stringWithFormat:@"%@年-%@月",_selectedYear,_selectedMonth];
    NSLog(@"%@",date);
    self.transform = CGAffineTransformIdentity;
}

- (void)show{
    [UIView animateWithDuration:0.1 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, -SCREEN_HEIGHT);
    }];
    if (self.isShowDay) {
        [self.datePicker selectRow:[_days indexOfObject:_thisDay] inComponent:4 animated:YES];
    }
}

#pragma mark - event response

- (void)sureBtnDidClick{
    if ([_delegate respondsToSelector:@selector(dateChooseView:withSelectedYearMonth:month:day:)]) {
        [_delegate dateChooseView:self withSelectedYearMonth:_selectedYear month:_selectedMonth day:_selectedDay];
    }
    [self dismiss];
}



- (void)layoutSubviews{
    [super layoutSubviews];
    if (_bgView) {
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(myheight(310));
            make.left.equalTo(self.mas_left).offset(mywidth(50));
            make.right.equalTo(self.mas_right).offset(mywidth(-50));
            make.height.mas_equalTo(myheight(430));
        }];
    }
    if (_titleLabel) {
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgView.mas_top).offset(myheight(20));
            make.centerX.equalTo(self.mas_centerX);
        }];
    }
    if (_topLineView) {
        [_topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(self.bgView.mas_top).offset(myheight(88));
            make.width.mas_equalTo(mywidth(640));
            make.height.mas_equalTo(myheight(1));
            make.centerX.equalTo(self.bgView.mas_centerX);
        }];
    }
    if (_datePicker) {
        [_datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topLineView.mas_bottom);
            make.centerX.equalTo(self.bgView.mas_centerX);
            make.height.mas_equalTo(myheight(262));
        }];
    }
    if (_bottomLineView) {
        [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.datePicker.mas_bottom);
            make.width.mas_equalTo(mywidth(640));
            make.height.mas_equalTo(myheight(1));
            make.centerX.equalTo(self.bgView.mas_centerX);
        }];
    }
    if (_sureBtn) {
        [_sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bottomLineView.mas_bottom).offset(myheight(24));
            make.centerX.equalTo(self.bgView.mas_centerX);
            make.bottom.equalTo(self.bgView.mas_bottom).offset(myheight(-24));
        }];
    }
    if (_boxTopLineView) {
        [_boxTopLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topLineView.mas_bottom).offset(myheight(96));
            make.width.mas_equalTo(mywidth(280));
            make.height.mas_equalTo(myheight(1));
            make.centerX.equalTo(self.bgView.mas_centerX);
        }];
    }
    if (_boxBottomLineView) {
        [_boxBottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bottomLineView.mas_top).offset(-myheight(76));
            make.width.mas_equalTo(mywidth(280));
            make.height.mas_equalTo(myheight(1));
            make.centerX.equalTo(self.bgView.mas_centerX);
        }];
    }
}

@end
