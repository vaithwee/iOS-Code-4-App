//
//  StudentTableViewCell.m
//  Use Realm By objc
//
//  Created by Vaith on 16/6/2.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

#import "StudentTableViewCell.h"

@interface StudentTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *birthdayLabel;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end

@implementation StudentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setStudent:(Student *)student
{
    self.nameLabel.text = [NSString stringWithFormat:@"Name:%@",student.name];
    self.sexLabel.text = [NSString stringWithFormat:@"Sex:%@",student.sexString];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score:%@",@(student.score)];
    self.classLabel.text = [NSString stringWithFormat:@"Class No:%@", @(student.classNum)];
    self.birthdayLabel.text = [NSString stringWithFormat:@"Birthday:%@", student.birthdayString];
}

@end
