//
//  ItemList.m
//  Tomato
//
//  Created by reubro1 on 06/09/17.
//  Copyright © 2017 reubro. All rights reserved.
//

#import "ItemList.h"
#import "TableViewCell.h"

@interface ItemList ()
@end
NSMutableArray *listOfSelectedItemNames;
NSMutableArray *listOfSelectedItemAmount;

@implementation ItemList

NSArray *tableData;
NSArray *imagesArray;
NSArray *amount;

//NSMutableArray *listOfSelectedItems;
//NSMutableArray *finalListOfSelectedItems;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController setNavigationBarHidden:YES];
    
    //NSMutableArray *finalListOfSelectedItems = [[NSMutableArray alloc] init];
    
    //array to store the selected items
    listOfSelectedItemNames = [[NSMutableArray alloc]init];
    listOfSelectedItemAmount = [[NSMutableArray alloc]init];
    
    tableData = [NSArray arrayWithObjects:@"ItemOne",@"ItemTwo",@"ItemThree",@"ItemFour",@"ItemFive",nil];
                             
    imagesArray = [NSArray arrayWithObjects:@"burger.png", @"sandwichone.png", @"sandwichtwo.png", @"sandwichtwo.png", @"sandwichtwo.png", nil];
    
    amount = [NSArray arrayWithObjects:@"7.99$", @"8.25$", @"3.99$", @"8.99$", @"6.99$", nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
    
    }

/*-(void)cleanView:(TableViewCell *)sender{
    [sender.switchButton setOn:NO animated:YES];
    [listOfSelectedItemNames removeAllObjects];
}*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.switchButton.tag = indexPath.row;
    [cell.switchButton addTarget:self action:@selector(actionSwitchButtonClicked:)forControlEvents:UIControlEventTouchUpInside];
    cell.nameLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:[imagesArray objectAtIndex:indexPath.row]];
    cell.amountLabel.text = [amount objectAtIndex:indexPath.row];
    return cell;
    
    }

-(void)actionSwitchButtonClicked:(UISwitch*)sender
{
  
  
   if ([sender isOn])
    {
        NSLog(@"product added");
        [listOfSelectedItemNames addObject:tableData[sender.tag]];
        [listOfSelectedItemAmount addObject:amount[sender.tag]];
        
    }
    
    else
    {
        NSLog(@"product removed");
        //if (!listOfSelectedItems){
            //check to ensure we do not delete from empty array
        [listOfSelectedItemNames removeObject:tableData[sender.tag]];
        [listOfSelectedItemAmount removeObject:amount[sender.tag]];
        //}
        }
        
    }

- (IBAction)actionCompleteOrderPressed:(id)sender {
    
    if ([listOfSelectedItemNames count] == 0){
        
        UIAlertController *emptycart = [UIAlertController alertControllerWithTitle:@"No item selected" message:@"Please select atleast one item" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        }];
        
        [emptycart addAction:ok];
        [self presentViewController:emptycart animated:YES completion:nil];
        
    }
    
    else{
    
    [self performSegueWithIdentifier:@"ItemListOrder" sender:sender];
        
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
