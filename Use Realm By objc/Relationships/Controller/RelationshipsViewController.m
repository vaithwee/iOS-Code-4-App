//
//  RelationshipsViewController.m
//  Use Realm By objc
//
//  Created by Vaith on 16/6/2.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

#import "RelationshipsViewController.h"
#import <Realm.h>
#import "AddOrEditPersonViewController.h"
#import "Person.h"
#import "Dog.h"
#import "AddOrEditDogViewController.h"

@interface RelationshipsViewController () <UITableViewDelegate, UITableViewDataSource, RelationshipsDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) RLMResults *data;
@end

@implementation RelationshipsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*seg*/
    [self.segment addTarget:self action:@selector(changeData) forControlEvents:UIControlEventValueChanged];
  
    /*data*/
    self.data = [Person allObjects];
    
    /*add*/
    UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
    [self.navigationItem setRightBarButtonItem:add];
    
    /*tableView*/
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

#pragma mark changeData
- (void)changeData
{
    self.data = self.segment.selectedSegmentIndex==0?[Person allObjects]:[Dog allObjects];
    [self.tableView reloadData];
}

- (void)didAddDog
{
    self.data = self.segment.selectedSegmentIndex==0?[Person allObjects]:[Dog allObjects];
    [self.tableView reloadData];
}

#pragma mark 添加完成
- (void)didAddPerson
{
    self.data = self.segment.selectedSegmentIndex==0?[Person allObjects]:[Dog allObjects];
    [self.tableView reloadData];
}

- (void)didEditDog
{
    self.data = self.segment.selectedSegmentIndex==0?[Person allObjects]:[Dog allObjects];
    [self.tableView reloadData];
}

#pragma mark 编辑完成
- (void)didEditPerson
{
    self.data = self.segment.selectedSegmentIndex==0?[Person allObjects]:[Dog allObjects];
    [self.tableView reloadData];
}

#pragma mark 添加
- (void)add
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    if (self.segment.selectedSegmentIndex == 0)
    {
        AddOrEditPersonViewController *control = [storyboard instantiateViewControllerWithIdentifier:@"AddOrEditPerson"];
        [control setDelegate:self];
        [self presentViewController:[[UINavigationController alloc] initWithRootViewController:control] animated:YES completion:nil];
    }
    else
    {
        AddOrEditDogViewController *control = [storyboard instantiateViewControllerWithIdentifier:@"AddOrEditDog"];
        [control setDelegate:self];
        [self presentViewController:[[UINavigationController alloc] initWithRootViewController:control] animated:YES completion:nil];
    }
}

#pragma mark table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

#pragma mark cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (self.segment.selectedSegmentIndex == 0)
    {
        Person *person = self.data[indexPath.row];
        for (Dog *dog in person.dogs)
        {
            NSLog(@"Dogs Name:%@", dog.name);
        }
        cell.textLabel.text = [NSString stringWithFormat:@"Name:%@ Age:%@", person.name, @(person.age)];
    }
    else
    {
        Dog *dog = self.data[indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"Name:%@ Age:%@ Owner:%@", dog.name, @(dog.age), dog.owner.name];
    }

    return cell;
}

#pragma mark 选择
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    if (self.segment.selectedSegmentIndex == 0)
    {
        AddOrEditPersonViewController *control = [storyboard instantiateViewControllerWithIdentifier:@"AddOrEditPerson"];
        [control setDelegate:self];
        [control setPerson:self.data[indexPath.row]];
        [self presentViewController:[[UINavigationController alloc] initWithRootViewController:control] animated:YES completion:nil];
    }
    else
    {
        AddOrEditDogViewController *control = [storyboard instantiateViewControllerWithIdentifier:@"AddOrEditDog"];
        [control setDelegate:self];
        [control setDog:self.data[indexPath.row]];
        [self presentViewController:[[UINavigationController alloc] initWithRootViewController:control] animated:YES completion:nil];    }
}

@end
