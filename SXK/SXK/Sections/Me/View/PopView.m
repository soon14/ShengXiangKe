//
//  PopView.m
//  SXK
//
//  Created by 杨伟康 on 2016/12/1.
//  Copyright © 2016年 ywk. All rights reserved.
//

#import "PopView.h"
#import "AppDelegate.h"

@interface PopView ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong)UIView *backGroundView;

@property (nonatomic, strong)UIView *alertView;

@property (nonatomic, strong)UIView *alertView1;

@property (nonatomic, strong)UIView *alertView2;

@property (nonatomic, strong)UILabel *titleLab;

@property (nonatomic, strong)UILabel *titleLab1;

@property (nonatomic, strong)UILabel *titleLab2;

@property (nonatomic, strong)UITextField *text;

@property (nonatomic, strong)UIView *mainView;

@property (nonatomic, strong)UIPickerView *yearPick;

@property (nonatomic, strong)NSMutableArray *yearArr;

@property (nonatomic, strong)UIPickerView *monthPick;

@property (nonatomic, strong)NSMutableArray *monthArr;

@end


@implementation PopView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.alpha = 0;
        self.frame = frame;
        [self loadSubView];
    }
    return self;
}

-(void)loadSubView
{
    self.backGroundView  = [[UIView alloc] initWithFrame:VIEWFRAME(0, 0, SCREEN_WIDTH, SCREEN_HIGHT)];
    self.backGroundView.backgroundColor = [UIColor colorWithHexColorString:@"3c3c3c"];
    self.backGroundView.alpha = 0;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.backGroundView addGestureRecognizer:tap];
    
    
    self.alertView = [[UIView alloc] initWithFrame:VIEWFRAME(30, SCREEN_HIGHT, CommonWidth(315), 190)];
    self.alertView.backgroundColor = [UIColor whiteColor];
    
    self.titleLab = [UILabel createLabelWithFrame:VIEWFRAME((self.alertView.frame.size.width - 100)/2, 18, 100, 14)                                                 andText:@""
                              andTextColor:[UIColor blackColor]
                                andBgColor:[UIColor clearColor]
                                   andFont:SYSTEMFONT(14)
                          andTextAlignment:NSTextAlignmentCenter];
    
    UIView *line = [[UIView alloc] initWithFrame:VIEWFRAME(0, 45.5, self.alertView.size.width, 0.5)];
    line.backgroundColor =[UIColor colorWithHexColorString:@"dcdcdc"];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    UIImage *backImage = [UIImage imageNamed:@"打叉-(2)"];
    [backBtn setImage:[backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    backBtn.frame = VIEWFRAME(self.alertView.frame.size.width - 27, 18, 12, 12);
    [backBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.text = [[UITextField alloc] initWithFrame:VIEWFRAME(30, 71, self.alertView.frame.size.width-60, 35)];
    self.text.placeholder = @"请输入新昵称";
    self.text.font = SYSTEMFONT(14);
    self.text.textAlignment = NSTextAlignmentCenter;
    self.text.backgroundColor = [UIColor colorWithHexColorString:@"f7f7f7"];
    ViewBorder(self.text, 0.5, [UIColor colorWithHexColorString:@"dedede"]);
    
    UIButton *cancelBtn =[UIButton buttonWithType:UIButtonTypeSystem];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor colorWithHexColorString:@"a1a1a1"] forState:UIControlStateNormal];
    cancelBtn.frame = VIEWFRAME(CommonWidth(57), 131, 81, 27);
    ViewBorderRadius(cancelBtn, 27/2, 0.5, [UIColor colorWithHexColorString:@"dfdfdf"]);
    
    UIButton *certainBtn =[UIButton buttonWithType:UIButtonTypeSystem];
    [certainBtn setTitle:@"确定" forState:UIControlStateNormal];
    [certainBtn setTitleColor:APP_COLOR_GREEN forState:UIControlStateNormal];
    certainBtn.frame = VIEWFRAME(CommonWidth(178), 131, 81, 27);
    ViewBorderRadius(certainBtn, 27/2, 0.5, APP_COLOR_GREEN);


    [self.alertView addSubview:self.titleLab];
    [self.alertView addSubview:line];
    [self.alertView addSubview:backBtn];
    [self.alertView addSubview:self.text];
    [self.alertView addSubview:cancelBtn];
    [self.alertView addSubview:certainBtn];
    
    
    self.alertView1 = [[UIView alloc] initWithFrame:VIEWFRAME(30, SCREEN_HIGHT, CommonWidth(315), 165)];
    self.alertView1.backgroundColor = [UIColor whiteColor];
    
    self.titleLab1 = [UILabel createLabelWithFrame:VIEWFRAME((self.alertView.frame.size.width - 100)/2, 18, 100, 14)                                                 andText:@""
                                     andTextColor:[UIColor blackColor]
                                       andBgColor:[UIColor clearColor]
                                          andFont:SYSTEMFONT(14)
                                 andTextAlignment:NSTextAlignmentCenter];
    
    UIView *line1 = [[UIView alloc] initWithFrame:VIEWFRAME(0, 45.5, self.alertView.size.width, 0.5)];
    line1.backgroundColor =[UIColor colorWithHexColorString:@"dcdcdc"];

    
    UIImage *firstImage = [UIImage imageNamed:@"椭圆-12-拷贝-2"];
    UIImage *secondImage = [UIImage imageNamed:@"椭圆-12-拷贝"];
    
    UIButton *backBtn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [backBtn1 setImage:[backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    backBtn1.frame = VIEWFRAME(self.alertView.frame.size.width - 27, 18, 12, 12);
    [backBtn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];

    
    UIButton * firstBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [firstBtn setImage:[firstImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [firstBtn setImage:[secondImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateSelected];
    
    
    UIButton * secondBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [secondBtn setImage:[firstImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [secondBtn setImage:[secondImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateSelected];

    UILabel *manLab = [UILabel createLabelWithFrame:VIEWFRAME((self.alertView.frame.size.width - 100)/2, 18, 100, 14)                                                 andText:@"男"
                                     andTextColor:[UIColor blackColor]
                                       andBgColor:[UIColor clearColor]
                                          andFont:SYSTEMFONT(14)
                                 andTextAlignment:NSTextAlignmentCenter];
    
    UILabel *womanLab = [UILabel createLabelWithFrame:VIEWFRAME((self.alertView.frame.size.width - 100)/2, 18, 100, 14)                                                 andText:@"女"
                                       andTextColor:[UIColor blackColor]
                                         andBgColor:[UIColor clearColor]
                                            andFont:SYSTEMFONT(14)
                                   andTextAlignment:NSTextAlignmentCenter];

    UIImageView *manImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"男1"]];
    UIImageView *womanImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"女-(1)"]];
    
    [self.alertView1 addSubview:self.titleLab1];
    [self.alertView1 addSubview:backBtn1];
    [self.alertView1 addSubview:line1];
    [self.alertView1 addSubview:manLab];
    [self.alertView1 addSubview:womanLab];
    [self.alertView1 addSubview:manImage];
    [self.alertView1 addSubview:womanImage];
    [self.alertView1 addSubview:firstBtn];
    [self.alertView1 addSubview:secondBtn];

    [firstBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom).offset(41);
        make.left.equalTo(self.alertView1.mas_left).offset(CommonWidth(64));
        make.size.mas_equalTo(CGSizeMake(19, 19));
    }];
    
    [manLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom).offset(41);
        make.left.equalTo(firstBtn.mas_right).offset(CommonWidth(5));
        make.size.mas_equalTo(CGSizeMake(20, 19));
    }];
    
    [manImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom).offset(41);
        make.left.equalTo(manLab.mas_right).offset(CommonWidth(5));
        make.size.mas_equalTo(CGSizeMake(19, 19));
    }];

    [womanImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom).offset(41);
        make.right.equalTo(self.alertView1.mas_right).offset(CommonWidth(-64));
        make.size.mas_equalTo(CGSizeMake(19, 19));
    }];

    [womanLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom).offset(41);
        make.right.equalTo(womanImage.mas_left).offset(CommonWidth(-5));
        make.size.mas_equalTo(CGSizeMake(19, 19));
    }];

    [secondBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom).offset(41);
        make.right.equalTo(womanLab.mas_left).offset(CommonWidth(-5));
        make.size.mas_equalTo(CGSizeMake(19, 19));
    }];


    
    
    self.titleLab2 = [UILabel createLabelWithFrame:VIEWFRAME((self.alertView.frame.size.width - 100)/2, 18, 100, 14)                                                 andText:@""
                                      andTextColor:[UIColor blackColor]
                                        andBgColor:[UIColor clearColor]
                                           andFont:SYSTEMFONT(14)
                                  andTextAlignment:NSTextAlignmentCenter];
    
    UIView *line2 = [[UIView alloc] initWithFrame:VIEWFRAME(0, 45.5, self.alertView.size.width, 0.5)];
    line2.backgroundColor =[UIColor colorWithHexColorString:@"dcdcdc"];

    UIButton *backBtn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [backBtn2 setImage:[backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    backBtn2.frame = VIEWFRAME(self.alertView.frame.size.width - 27, 18, 12, 12);
    [backBtn2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];

    
    self.alertView2 = [[UIView alloc] initWithFrame:VIEWFRAME(30, SCREEN_HIGHT, CommonWidth(315), 210)];
    self.alertView2.backgroundColor = [UIColor whiteColor];

    self.yearPick = [[UIPickerView alloc] initWithFrame:VIEWFRAME((self.alertView2.size.width - 86-86-CommonWidth(50))/2, 46, 86, CommonHight(120))];
    self.yearPick.delegate = self;
    self.yearPick.dataSource = self;
    
    self.monthPick = [[UIPickerView alloc] initWithFrame:VIEWFRAME((self.alertView2.size.width - 86-86-CommonWidth(50))/2+50+86, 46, 86, CommonHight(120))];
    self.monthPick.delegate = self;
    self.monthPick.dataSource = self;
    
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate* dt = [NSDate date];
    unsigned unitFlags = NSCalendarUnitYear |
    NSCalendarUnitMonth |  NSCalendarUnitDay |
    NSCalendarUnitHour |  NSCalendarUnitMinute |
    NSCalendarUnitSecond | NSCalendarUnitWeekday;
    NSDateComponents* comp = [gregorian components: unitFlags
                                          fromDate:dt];

    self.yearArr = [NSMutableArray new];
    for (NSInteger i = comp.year; i > 1950;i-- ) {
        [self.yearArr addObject:[NSString stringWithFormat:@"%ld",(long)i]];
    }
    
    self.monthArr = [NSMutableArray new];
    for (int i = 1; i < 13; i++) {
        [self.monthArr addObject:[NSString stringWithFormat:@"%ld",(long)i]];
    }
    
    UIButton *certainBtn1 =[UIButton buttonWithType:UIButtonTypeSystem];
    [certainBtn1 setTitle:@"确定" forState:UIControlStateNormal];
    [certainBtn1 setTitleColor:APP_COLOR_GREEN forState:UIControlStateNormal];
    certainBtn1.frame = VIEWFRAME((self.alertView2.size.width - 81)/2, 215, 81, 27);
    ViewBorderRadius(certainBtn1, 27/2, 0.5, APP_COLOR_GREEN);
    
    
    [self.alertView2 addSubview:self.titleLab2];
    [self.alertView2 addSubview:line2];
    [self.alertView2 addSubview:backBtn2];
    [self.alertView2 addSubview:self.yearPick];
    [self.alertView2 addSubview:self.monthPick];
    [self.alertView2 addSubview:certainBtn1];
    
//    self.yearPick.backgroundColor = [UIColor greenColor];
//    self.monthPick.backgroundColor = [UIColor greenColor];
    
//    [self.yearPick mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(line2.mas_bottom).offset(0);
//        make.left.equalTo(self.alertView2.mas_left).offset((self.alertView2.size.width - 86-86-CommonWidth(50))/2);
//        make.size.mas_equalTo(CGSizeMake(86, CommonHight(120)));
//    }];
//    
//    [self.monthPick mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(line2.mas_bottom).offset(0);
//        make.left.equalTo(self.yearPick.mas_right).offset(CommonWidth(50));
//        make.size.mas_equalTo(CGSizeMake(86, CommonHight(120)));
//    }];

//    [self.yearPick selectRow:10 inComponent:0 animated:YES];

    
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWasShown:)
     
                                                 name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(keyboardWillBeHidden:)
     
                                                 name:UIKeyboardWillHideNotification object:nil];
    

    
}

-(void)show2
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.window addSubview:self.backGroundView];
    [appDelegate.window addSubview:self.alertView2];
    self.mainView = self.alertView2;
    self.backGroundView.alpha = 0.5;
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [UIView animateWithDuration:0.5 animations:^{
                
                self.alertView2.frame = VIEWFRAME(CommonWidth(30), CommonHight(214), CommonWidth(315), 260);
                
            } completion:^(BOOL finished) {
                
            }];
        });
    });
    
}


-(void)show1
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.window addSubview:self.backGroundView];
    [appDelegate.window addSubview:self.alertView1];
    self.mainView = self.alertView1;
    self.backGroundView.alpha = 0.5;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [UIView animateWithDuration:0.5 animations:^{
                
                self.alertView1.frame = VIEWFRAME(CommonWidth(30), CommonHight(294), CommonWidth(315), 165);
                
            } completion:^(BOOL finished) {
                
            }];
        });
    });

}


-(void)show
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.window addSubview:self.backGroundView];
    [appDelegate.window addSubview:self.alertView];
    self.mainView = self.alertView;
    self.backGroundView.alpha = 0.5;

    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [UIView animateWithDuration:0.5 animations:^{
                
                self.alertView.frame = VIEWFRAME(CommonWidth(30), CommonHight(294), CommonWidth(315), 190);
                
            } completion:^(BOOL finished) {
                
            }];
        });
    });

}

-(void)tapAction:(UITapGestureRecognizer *)tap
{
    [self.text resignFirstResponder];
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [UIView animateWithDuration:0.5 animations:^{
                
                    self.mainView.frame = VIEWFRAME(30, SCREEN_HIGHT,CommonWidth(315), CommonHight(190));
                
            } completion:^(BOOL finished) {
                    [self.backGroundView removeFromSuperview];
                    [self.mainView removeFromSuperview];
                
            }];
        });
    });
}

-(void)btnAction:(UIButton *)sender
{
    [self.text resignFirstResponder];
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [UIView animateWithDuration:0.5 animations:^{
                
                self.mainView.frame = VIEWFRAME(30, SCREEN_HIGHT,CommonWidth(315), CommonHight(190));
                
            } completion:^(BOOL finished) {
                [self.backGroundView removeFromSuperview];
                [self.mainView removeFromSuperview];
                
            }];
        });
    });

}

- (void)keyboardWasShown:(NSNotification*)aNotification

{
    
    //键盘高度
    
    
    CGRect keyBoardFrame = [[[aNotification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];

    
            [UIView animateWithDuration:0.5 animations:^{
                
                self.mainView.frame = VIEWFRAME(CommonWidth(30), SCREEN_HIGHT-keyBoardFrame.size.height-190, CommonWidth(315), 190);
                
            } completion:^(BOOL finished) {
                
            }];


    
}

-(void)keyboardWillBeHidden:(NSNotification*)aNotification

{
    
    
            [UIView animateWithDuration:0.5 animations:^{
                
                self.mainView.frame = VIEWFRAME(CommonWidth(30), CommonHight(294), CommonWidth(315), 190);
                
            } completion:^(BOOL finished) {
                
            }];

    
}

-(void)fillWithTitle:(NSString *)title
{
        
    if ([title isEqualToString:@"修改昵称"]) {
        self.text.placeholder = @"请输入新昵称";
        self.titleLab.text = title;
    }
    
    if ([title isEqualToString:@"手机号码"]) {
        self.text.placeholder = @"请输入手机号码";
        self.titleLab.text = title;
    }
    if ([title isEqualToString:@"修改性别"]) {
        self.titleLab1.text = title;
    }
    if ([title isEqualToString:@"出生年月"]) {
        self.titleLab2.text = title;
    }

    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == self.monthPick) {
        return self.monthArr.count;
    }
    return self.yearArr.count;
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == self.monthPick) {
        return self.monthArr[row];
    }
    return self.yearArr[row];
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 30.0f;
}


- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    
    
    return 86;
}

// 自定义指定列的每行的视图，即指定列的每行的视图行为一致
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
//    if (!view){
//        view = [[UIView alloc]init];
//    }
    UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 86, 20)];
    text.textAlignment = NSTextAlignmentCenter;
    if (pickerView == self.monthPick) {
        text.text = self.monthArr[row];
    }else{
        text.text = self.yearArr[row];
    }
    for(UIView *singleLine in pickerView.subviews)
    {
        if (singleLine.frame.size.height < 1)
        {
            singleLine.backgroundColor = [UIColor colorWithHexColorString:@"dcdcdc"];
        }
    }
    
//    [view addSubview:text];
    
    return text;
}

@end