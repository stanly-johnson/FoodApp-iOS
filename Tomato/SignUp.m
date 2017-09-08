//
//  SignUp.m
//  Tomato
//
//  Created by reubro1 on 06/09/17.
//  Copyright © 2017 reubro. All rights reserved.
//

#import "SignUp.h"

@interface SignUp ()

@end

@implementation SignUp

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
    //[self performSegueWithIdentifier:@"ItemSignUpSegue" sender:sender];
    [self validate:self.textFields];
    [self performSegueWithIdentifier:@"ItemSignUpSegue" sender:sender];
    
}

-(BOOL) StringIsValidEmail:(NSString *)checkString
    {
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
    }

- (BOOL) StringIsValidNumber:(NSString *)checkString
    {
    NSString *numberTester = @"^[2-9][0-9]{9}$";
    NSPredicate *numberTesterPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberTester];
    return [numberTesterPredicate evaluateWithObject:checkString];
    }


- (void)validate:(NSArray<UITextField *>*)labels {
    NSMutableArray<UITextField *>* invalidFields = [NSMutableArray new];
    
    for (UITextField* field in self.textFields) {
        
        
        //username test
        if(field == self.userName){
            if([field.text isEqualToString:@""]){
                [invalidFields addObject:field];
            }
        }
        
        //email test
        if (field == self.userEmail){
            if (![self StringIsValidEmail: self.userEmail.text] || [field.text isEqualToString:@""]){
                [invalidFields addObject:field];
                }
                
        }
        
        //number test
        if (field == self.userMobile){
            if (![self StringIsValidNumber: self.userMobile.text] || [field.text isEqualToString:@""]){
                [invalidFields addObject:field];
            }
            
        }
        
        //password test
        if (field == self.userPassword){
            if ([field.text isEqualToString:@""]){
                [invalidFields addObject:field];
            }
        }
        
        
        
    }//forloop
        
            //function call to action button
            [self displayWarningForInvalidLabesIfNeeded: invalidFields];
        
        
    }//validatemethod




- (void)displayWarningForInvalidLabesIfNeeded:(NSArray<UITextField *>*)invalidFields {
    if ([invalidFields count] == 0) {
        //when all fields are valid
        return;
       
    }
    
    NSMutableString* invalidFieldsMessage = [NSMutableString new];
    // Create string from invalid fields placeholder
    for (UITextField* field in invalidFields) {
        [invalidFieldsMessage appendString: field.placeholder];
        [invalidFieldsMessage appendString: @"\n"];
    }
    
    // Show the alert with the invalid fields
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Invalid Data" message:invalidFieldsMessage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // code for handling when user pressed OK
        NSLog(@"ok pressed");
    }];
    
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
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
