//
//  OrderCompletion.m
//  Tomato
//
//  Created by reubro1 on 06/09/17.
//  Copyright © 2017 reubro. All rights reserved.
//

#import "OrderCompletion.h"
#import "ItemList.h"

@interface OrderCompletion ()

@end
extern NSMutableArray *listOfSelectedItemNames;
extern NSMutableArray *listOfSelectedItemAmount;
@implementation OrderCompletion
//NSMutableArray *finalListOfSelectedItems;
@synthesize totalAmountLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO];
    //finalListOfSelectedItems = [[NSMutableArray alloc] init];
    /*int i = 0;
    while(finalListOfSelectedItems count){
        //NSLog(@"%@",finalListOfSelectedItems[i]);
        NSLog(@"hi");
        i++;
    }
    
    for(id obj in listOfSelectedItemNames)
        NSLog(@"%@",obj);
    for(id obj in listOfSelectedItemAmount)
        NSLog(@"%@",obj);
    
    */
    
    float total = 0.0;
    for(NSString *obj in listOfSelectedItemAmount){
        total+= [obj floatValue];
    }
    totalAmountLabel.text = [NSString stringWithFormat:@"%0.2f %@",total,@"$"];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionPaymentButtonPressed:(id)sender {
    
    UIAlertController *confirm = [UIAlertController alertControllerWithTitle:@"Confirm" message:@"Are you sure you want to proceed?" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *yes = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        
        [self performSegueWithIdentifier:@"confirmationSegue" sender:sender];
    
    }];
    
    UIAlertAction *no = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
}];
    
    [confirm addAction:yes];
    [confirm addAction:no];
    [self presentViewController:confirm animated:YES completion:nil];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [listOfSelectedItemNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    NSString *data = [NSString stringWithFormat:@"%@ \t\t\t %@",[listOfSelectedItemNames objectAtIndex:indexPath.row],[listOfSelectedItemAmount objectAtIndex:indexPath.row]];
        cell.textLabel.text = data;
    //cell.textLabel.text = [listOfSelectedItemAmount objectAtIndex:indexPath.row];
    return cell;
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
