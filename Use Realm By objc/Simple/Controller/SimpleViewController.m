//
//  SimpleViewController.m
//  Use Realm By objc
//
//  Created by OrangeLife on 16/6/2.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

#import "SimpleViewController.h"
#import "AddOrEditStudentViewController.h"
#import "Student.h"
#import <Realm.h>
#import "StudentTableViewCell.h"

@interface SimpleViewController ()<UITableViewDataSource, UITableViewDelegate,StudentDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) RLMResults *data;
@end

@implementation SimpleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*获取数据*/
    self.data = [[Student allObjects] sortedResultsUsingProperty:@"name" ascending:YES];
    
    /*添加按钮*/
    UIBarButtonItem *add = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
    [self.navigationItem setRightBarButtonItem:add];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"StudentTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"StudentTableViewCell"];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.tableView setRowHeight:100.f];
    [self.tableView setTableFooterView:[UIView new]];
}

#pragma mark 添加数据
- (void)add
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    AddOrEditStudentViewController *control = [storyboard instantiateViewControllerWithIdentifier:@"AddStudent"];
    [control setDelegate:self];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:control];
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark 数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

#pragma mark cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StudentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StudentTableViewCell"];
    Student *stu = self.data[indexPath.row];
    [cell setStudent:stu];
    return cell;
}

#pragma mark 选择
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Student *stu = self.data[indexPath.row];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    AddOrEditStudentViewController *control = [storyboard instantiateViewControllerWithIdentifier:@"AddStudent"];
    [control setDelegate:self];
    [control setStudent:stu];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:control];
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark 添加完成
- (void)didAddStudent
{
    self.data = [[Student allObjects] sortedResultsUsingProperty:@"name" ascending:YES];
    [self.tableView reloadData];
}

- (void)didEditAndUpdateWithStudent:(Student *)student
{
    self.data = [Student allObjects];
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            [realm deleteObject:self.data[indexPath.row]];
            self.data = [[Student allObjects] sortedResultsUsingProperty:@"name" ascending:YES];
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        }];
  
        
    }
}


@end
