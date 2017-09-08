//
//  OrderCompletion.h
//  Tomato
//
//  Created by reubro1 on 06/09/17.
//  Copyright © 2017 reubro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderCompletion : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UIButton *paymentButton;
@property (strong, nonatomic) IBOutlet UILabel *totalAmountLabel;

@end
	
