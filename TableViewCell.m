//
//  TableViewCell.m
//  Tomato
//
//  Created by reubro1 on 06/09/17.
//  Copyright © 2017 reubro. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

@synthesize nameLabel;
@synthesize amountLabel;
@synthesize thumbnailImageView;
@synthesize switchButton;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
