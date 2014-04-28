//
//  SampleTableViewController.m
//  iOSExamples
//
//  Created by Mike Chen on 4/28/14.
//  Copyright (c) 2014 Mike Chen. All rights reserved.
//

#import "SampleTableViewController.h"
#import "ViewControllerA.h"
#import "WebViewController.h"


@interface SampleTableViewController ()

@end

@implementation SampleTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    
    self.topArray = [[NSMutableArray alloc] init];
    [self.topArray addObject:@"one"];
    [self.topArray addObject:@"two"];
    [self.topArray addObject:@"three"];
    
    
    self.bottomArray = [NSArray arrayWithObjects:@"A",@"B",@"C", nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.topArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    UIImageView *imageView = (UIImageView*) [cell viewWithTag:102];
    [imageView setImage:[UIImage imageNamed:@"Placeholder"]];
    
    UILabel *topLabel = (UILabel*)[cell viewWithTag:100];
    topLabel.text = [self.topArray objectAtIndex:indexPath.row];
    
    
    UILabel *bottomLabel = (UILabel *)[cell viewWithTag:101];
    bottomLabel.text = [self.bottomArray objectAtIndex:indexPath.row];
    
   // cell.textLabel.text = @"hello";
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"did select %li", (long)indexPath.row);

    /* Works fine
    WebViewController *wvc = [[WebViewController alloc] init];
    
     Does not work, it's loaded but nothing is shown, must initiate through storyboard
     id example below to work.
    ViewControllerA *vcA = [[ViewControllerA alloc] init];
     The reason is you are creatin the view objects in storyboard so of course
     you have to instantiate the object through storyboard, if you do alloc init
     it just creates the object without the storyboard
     */
    
    ViewControllerA *vcA = (ViewControllerA *)[self.storyboard instantiateViewControllerWithIdentifier:@"ViewControllerA"];
    [self.navigationController pushViewController:vcA animated:true];
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    
    if ([segue.identifier isEqualToString:@"tableViewSegue"]) {
        ViewControllerA *vcA = (ViewControllerA*)segue.destinationViewController;
        [vcA.view setBackgroundColor:[UIColor greenColor]];
        
        
        // Find the index path that was selected
        NSIndexPath *index = [self.tableView indexPathForSelectedRow];
        NSInteger rowSelected = index.row;
        NSLog(@"%ld", (long)rowSelected) ;
    }
    
}


@end





















