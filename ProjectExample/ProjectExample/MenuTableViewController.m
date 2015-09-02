//
//  MenuTableViewController.m
//  ProjectExample
//
//  Created by Simone on 02/09/15.
//  Copyright (c) 2015 bsdsoftware.it. All rights reserved.
//

#import "MenuTableViewController.h"
#import <UIViewController+MMDrawerController.h>
#import "NSNotificationCenter+Menu.h"

@interface MenuTableViewController ()

@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger idxCella = indexPath.row;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[NSNotificationCenter defaultCenter] inviaNotificaPerVoceDiMenuConIndice:idxCella];
    [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
}

@end
