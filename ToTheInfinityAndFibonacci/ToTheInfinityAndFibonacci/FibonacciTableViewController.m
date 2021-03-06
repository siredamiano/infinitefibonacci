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

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
    /* Create custom view to display section header... */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 25, tableView.frame.size.width, 18)];
    [label setFont:[UIFont boldSystemFontOfSize:16]];
        /* Section header is in 0th index... */
    [label setText:@"Infinity Fibonacci"];
    [view addSubview:label];
    [view setBackgroundColor:[UIColor redColor]];
     return view;
}


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


@end
