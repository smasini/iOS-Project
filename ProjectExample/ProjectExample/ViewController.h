//
//  ViewController.h
//  ProjectExample
//
//  Created by Simone on 01/09/15.
//  Copyright (c) 2015 bsdsoftware.it. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Database.h"
@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableContatti;

@property(nonatomic, strong) Database *database;

@end

