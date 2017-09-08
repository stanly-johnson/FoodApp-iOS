//
//  ViewController.m
//  Tomato
//
//  Created by reubro1 on 06/09/17.
//  Copyright © 2017 reubro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionSignUpButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"SignUpSegue" sender:sender];
}
- (IBAction)actionLoginButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"LogInSegue" sender:sender];
}


@end
