//
//  AddStudentViewController.m
//  Use Realm By objc
//
//  Created by OrangeLife on 16/6/2.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

#import "AddOrEditStudentViewController.h"
#import <Realm.h>
#import "Student.h"

@interface AddOrEditStudentViewController ()<UITableViewDataSource, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *scoreTextField;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sexSeg;

@property (weak, nonatomic) IBOutlet UITextField *classTextField;
@property (weak, nonatomic) IBOutlet UITextField *birTextField;
@property (strong, nonatomic) UIDatePicker *picker;
@end

@implementation AddOrEditStudentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    [self.navigationItem setLeftBarButtonItem:cancelButton];
    
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save)];
    [self.navigationItem setRightBarButtonItem:saveButton];
    
    /**/
    [self.tableView setTableFooterView:[UIView new]];
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    /*日期选择器*/
    UIDatePicker *picker = [[UIDatePicker alloc] init];
    [picker setDatePickerMode:UIDatePickerModeDate];
    [picker setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hans_CN"]];
    [self.birTextField setInputView:picker];
    [self.birTextField setDelegate:self];
    self.picker = picker;
    
    /*读取默认数据*/
    if (self.student) {
        self.nameTextField.text = self.student.name;
        self.sexSeg.selectedSegmentIndex = self.student.sex?1:0;
        self.scoreTextField.text = [NSString stringWithFormat:@"%@",@(self.student.score)];
        self.classTextField.text = [NSString stringWithFormat:@"%@", @(self.student.classNum)];
        self.picker.date = self.picker.date;
        self.birTextField.text = self.student.birthdayString;
    }
}

#pragma mark 保存
- (void)save
{
    if (self.student)
    {
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            self.student.name = self.nameTextField.text;
            self.student.sex = self.sexSeg.selectedSegmentIndex;
            self.student.score = self.scoreTextField.text.integerValue;
            self.student.classNum = self.classTextField.text.integerValue;
            self.student.birthday = [NSDate date];
        }];
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(didEditAndUpdateWithStudent:)]) {
            [self.delegate didEditAndUpdateWithStudent:self.student];
        }
    }
    else
    {
        
        
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        Student *s = [[Student alloc] init];
        s.name = [self.nameTextField.text isEqualToString:@""]?s.name:self.nameTextField.text;
        s.sex = self.sexSeg.selectedSegmentIndex;
        s.score = self.scoreTextField.text.integerValue;
        s.classNum = self.classTextField.text.integerValue;
        s.birthday = self.picker.date;
        [realm transactionWithBlock:^{
            [realm addObject:s];
        }];
        if (self.delegate && [self.delegate respondsToSelector:@selector(didAddStudent)]) {
            [self.delegate didAddStudent];
        }
        
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 取消
- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 日期选择
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yy年MM月dd日"];
    
    
    self.birTextField.text = [formatter stringFromDate:self.picker.date];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

@end
