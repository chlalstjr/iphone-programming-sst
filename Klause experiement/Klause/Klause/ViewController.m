//
//  ViewController.m
//  Klause
//
//  Created by Rayner Tan Xue Wen on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "KlauseEntryViewController.h"
#import "Klause.h"
#import "ContactDetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize context, arr;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated {
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Klause" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setFetchBatchSize:20];
    [request setEntity:entity];
    NSSortDescriptor * sort = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
    NSArray *newArray = [NSArray arrayWithObject:sort];
    [request setSortDescriptors:newArray];
    NSError *error;
    NSMutableArray *results = [[context executeFetchRequest:request error:&error] mutableCopy];
    [self setArr:results];
    [self.tableView reloadData];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(delete)];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

-(void) delete {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Klause" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSError *error;
    NSArray *items = [context executeFetchRequest:fetchRequest error:&error];
    
    for (NSManagedObject *managedObject in items) {
        [context deleteObject:managedObject];
    }
    if (![context save:&error]) {
    }
    
    [self.tableView reloadData];
         
}

-(void) add{
    
    KlauseEntryViewController * klauseEntry = [[KlauseEntryViewController alloc] init];
    [self.navigationController presentModalViewController:klauseEntry animated:YES];
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
    return [arr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    Klause *klause = [arr objectAtIndex:indexPath.row];
    cell.textLabel.text = [klause title];
    cell.detailTextLabel.text = [klause content];
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    ContactDetailViewController *contact = [[ContactDetailViewController alloc] initWithNibName:@"ContactDetailViewController" bundle:[NSBundle mainBundle]];
 
    contact.context = context;
    
    Klause *klause = [arr objectAtIndex:indexPath.row];
    
    contact.klause = klause;
    
    [self.navigationController pushViewController:contact animated:YES];
    
}

@end
