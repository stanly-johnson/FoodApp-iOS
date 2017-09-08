//
//  Confirmation.m
//  Tomato
//
//  Created by reubro1 on 07/09/17.
//  Copyright © 2017 reubro. All rights reserved.
//

#import "Confirmation.h"

@interface Confirmation ()
@end

extern NSMutableArray *listOfSelectedItemNames;
extern NSMutableArray *listOfSelectedItemAmount;

@implementation Confirmation

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    [listOfSelectedItemNames removeAllObjects];
    [listOfSelectedItemAmount removeAllObjects];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionexitButtonPressed:(id)sender {
    
    UIAlertController *exitButton = [UIAlertController alertControllerWithTitle:@"Are you sure you want to exit?" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *yes = [UIAlertAction actionWithTitle:@"Exit" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        exit(0);
    }];
    
    UIAlertAction *no = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    //return to view controller
    }];
    
    [exitButton addAction:yes];
    [exitButton addAction:no];
    [self presentViewController:exitButton animated:YES completion:nil];
    
}


- (IBAction)actionPlaceNewOrder:(id)sender {
    
      
    UIViewController *destination = [self.navigationController.viewControllers objectAtIndex:2];
    [self.navigationController popToViewController:destination animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
