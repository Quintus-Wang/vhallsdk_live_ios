//
//  WatchLiveQATableViewCell.m
//  VHallSDKDemo
//
//  Created by Ming on 16/8/25.
//  Copyright © 2016年 vhall. All rights reserved.
//

#import "WatchLiveQATableViewCell.h"

@implementation WatchLiveQATableViewCell
{
    __weak IBOutlet UILabel *lblType;
    __weak IBOutlet UILabel *lblNickName;
    __weak IBOutlet UILabel *lblTime;
    __weak IBOutlet UILabel *lblContent;
    __weak IBOutlet UILabel *lblQuestionID;
    __weak IBOutlet UILabel *lblJoinID;
    __weak IBOutlet UILabel *lblRole;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    lblNickName.text   = [NSString stringWithFormat:@"%@:", _model.nick_name];
    lblTime.text       = _model.created_at;
    lblContent.text    = [NSString stringWithFormat:@"%@\n\n\n", _model.content];
    lblJoinID.text     = [NSString stringWithFormat:@"参会 ID:%@",_model.join_id];
    if ([_model.type isEqualToString:@"question"])
    {
        lblRole.text = @"[--]";
        lblType.text = @"问题";
        lblQuestionID.text = [NSString stringWithFormat:@"问题 ID:%@", _model.question_id];
    }
    else if ([_model.type isEqualToString:@"answer"])
    {
        lblType.text = @"回答";
        
        VHallAnswerModel* answer = (VHallAnswerModel *)_model;
        NSString* role = @"";
        if([answer.role_name isEqualToString:@"host"]) {
            role = @"主持人";
        }else if([answer.role_name isEqualToString:@"guest"]) {
            role = @"嘉宾";
        }else if([answer.role_name isEqualToString:@"assistant"]) {
            role = @"助手";
        }else if([answer.role_name isEqualToString:@"user"]) {
            role = @"观众";
        }
        lblRole.text = [NSString stringWithFormat:@"[%@]", role];
        lblQuestionID.text = [NSString stringWithFormat:@"问题 ID:%@  回答 ID:%@ 【%@】", _model.question_id, answer.answer_id,answer.is_open?@"公开":@"私密"];
    }
}

@end
