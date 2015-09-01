//
//  ViewController.m
//  ProjectExample
//
//  Created by Simone on 01/09/15.
//  Copyright (c) 2015 bsdsoftware.it. All rights reserved.
//

#import "ViewController.h"
#import "Contatto.h"
#import "ContattoTableViewCell.h"

@interface ViewController ()

@property(nonatomic, strong) NSArray *contatti;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableContatti.rowHeight = UITableViewAutomaticDimension;
    self.tableContatti.estimatedRowHeight = 44;
    self.database = [Database new];
    [self.database connetti];
    self.contatti = [self.database tuttiContatti];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [self.database disconnetti];
    self.database = nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contatti count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContattoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellacontatto2" forIndexPath:indexPath];
    cell.lblNome.text = ((Contatto *) self.contatti[indexPath.row]).nome;
    cell.lblNumero.text = ((Contatto *) self.contatti[indexPath.row]).numero;
    
    return cell;
}

@end
