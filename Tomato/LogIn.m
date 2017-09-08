//
//  LogIn.m
//  Tomato
//
//  Created by reubro1 on 06/09/17.
//  Copyright © 2017 reubro. All rights reserved.
//

#import "LogIn.h"

@interface LogIn ()

@end

@implementation LogIn

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)actionSubmitButtonPressed:(id)sender {
    
    if([self.inputEmail.text isEqualToString:@"mail@tomato.com"] && [self.inputPassword.text isEqualToString:@"123"]){
                    [self performSegueWithIdentifier:@"ItemLoginSegue" sender:sender];
        
    }
    
    else {
        UIAlertController *warning = [UIAlertController alertControllerWithTitle:@"Invalid UserName or Password" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okbutton = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"password fail warning");
        }];
        
        [warning addAction:okbutton];
        [self presentViewController:warning animated:YES completion:nil];
    }
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
