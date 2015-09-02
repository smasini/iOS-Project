//
//  EditTableViewController.h
//  ProjectExample
//
//  Created by Simone on 02/09/15.
//  Copyright (c) 2015 bsdsoftware.it. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Database.h"
#import "Contatto.h"

@interface EditTableViewController : UITableViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtNome;
@property (weak, nonatomic) IBOutlet UITextField *txtCognome;
@property (weak, nonatomic) IBOutlet UITextField *txtNumero;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtIndirizzo;
- (IBAction)salva:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnSalva;

@property(nonatomic, strong) Database *database;
@property(nonatomic, strong) Contatto *contatto;
@end
