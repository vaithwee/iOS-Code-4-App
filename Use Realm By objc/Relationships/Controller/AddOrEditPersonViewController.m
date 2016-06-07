//
//  AddOrEditPersonViewController.m
//  Use Realm By objc
//
//  Created by Vaith on 16/6/3.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

#import "AddOrEditPersonViewController.h"
#import <Realm.h>
#import "Person.h"

@interface AddOrEditPersonViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dogsTextField;

@end

@implementation AddOrEditPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*cancel*/
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    [self.navigationItem setLeftBarButtonItem:cancelButton];
    
    /*save*/
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save)];
    [self.navigationItem setRightBarButtonItem:saveButton];
    
    /**/
    [self.tableView setTableFooterView:[UIView new]];
    
    /*数据*/
    if (self.person)
    {
        self.nameTextField.text = self.person.name;
        self.ageTextField.text = [NSString stringWithFormat:@"%@", @(self.person.age)];
    }
}

#pragma mark save
-(void)save
{
    if (self.person)
    {
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            self.person.age = self.ageTextField.text.integerValue;
            self.person.name = self.nameTextField.text;
        }];
        if (self.delegate && [self.delegate respondsToSelector:@selector(didEditPerson)])
        {
            [self.delegate didEditPerson];
        }
    }
    else
    {
        RLMRealm *realm = [RLMRealm defaultRealm];
        Person *p = [[Person alloc] init];
        p.name = self.nameTextField.text;
        p.age = self.ageTextField.text.integerValue;
        [realm transactionWithBlock:^{
            [realm addObject:p];
        }];
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(didAddPerson)])
        {
            [self.delegate didAddPerson];
        }
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark 取消
- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}

/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }
 */

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
