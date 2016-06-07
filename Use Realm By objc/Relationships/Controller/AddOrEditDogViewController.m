//
//  AddOrEditDogViewController.m
//  Use Realm By objc
//
//  Created by OrangeLife on 16/6/3.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

#import "AddOrEditDogViewController.h"
#import <Realm.h>
#import "Person.h"

@interface AddOrEditDogViewController ()<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *ownerTextField;
@property (strong, nonatomic) UIPickerView *picker;
@property (strong, nonatomic) RLMResults *data;
@end

@implementation AddOrEditDogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = [Person allObjects];
    
    /*cancel*/
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    [self.navigationItem setLeftBarButtonItem:cancelButton];
    
    /*save*/
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save)];
    [self.navigationItem setRightBarButtonItem:saveButton];
    
    /**/
    [self.tableView setTableFooterView:[UIView new]];
    
    /*owner picker*/
    UIPickerView *picker = [UIPickerView new];
    [picker setDelegate:self];
    [picker setDataSource:self];
    [self.ownerTextField setInputView:picker];
    [self.ownerTextField setDelegate:self];
    self.picker = picker;
    
    if (self.dog)
    {
        self.nameTextField.text = self.dog.name;
        self.ageTextField.text = [NSString stringWithFormat:@"%@", @(self.dog.age)];
        self.ownerTextField.text = self.dog.owner.name;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSInteger row = [self.picker selectedRowInComponent:0];
    self.ownerTextField.text =((Person *)self.data[row]).name;
}

#pragma mark 保存
- (void)save
{
    if (self.dog)
    {
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            self.dog.name = self.nameTextField.text;
            self.dog.age = self.ageTextField.text.integerValue;
            self.dog.owner = self.data[[self.picker selectedRowInComponent:0]];
        }];
        if (self.delegate && [self.delegate respondsToSelector:@selector(didEditDog)])
        {
            [self.delegate didEditDog];
        }
    }
    else
    {
        RLMRealm *realm = [RLMRealm defaultRealm];
        Dog *dog = [[Dog alloc] init];
        dog.name = self.nameTextField.text;
        dog.age = self.ageTextField.text.integerValue;
        dog.owner = self.data[[self.picker selectedRowInComponent:0]];
        [realm transactionWithBlock:^{
            [realm addObject:dog];
        }];
        if (self.delegate && [self.delegate respondsToSelector:@selector(didAddDog)])
        {
            [self.delegate didAddDog];
        }
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 取消
- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark picker
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.data.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    Person *p = self.data[row];
    return p.name;
}

#pragma mark table
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

@end
