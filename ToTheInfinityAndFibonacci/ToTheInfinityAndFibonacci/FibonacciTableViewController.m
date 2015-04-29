//
//  FibonacciTableViewController.m
//  ToTheInfinityAndFibonacci
//
//  Created by Damian A Torres on 4/28/15.
//  Copyright (c) 2015 El Pueblito. All rights reserved.
//

#import "FibonacciTableViewController.h"
#import "Fibonacci.h"
#import "JKBigInteger.h"

@interface FibonacciTableViewController ()

@property(nonatomic, strong) NSMutableArray *tableValues;
@property(nonatomic, strong) Fibonacci *fib;

@end

@implementation FibonacciTableViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableValues = [[NSMutableArray alloc] init];
    self.fib = [[Fibonacci alloc] init];
    
    for(int i = 0; i < 20; i++) {
        [self.tableValues addObject:[self.fib nextSequence]];
    }

    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [self.tableValues count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    // Configure the cell...
    cell.textLabel.text = [(JKBigInteger *)[self.tableValues objectAtIndex:indexPath.row] stringValue];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
    
       //Add call to fibonacci here
        [self addValueToArray:self.tableValues.count];
        
    });
    
    [self.tableView reloadData];
}

- (void) addValueToArray: (NSInteger) index {
    [self.tableValues insertObject:[self.fib nextSequence] atIndex:index];
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
