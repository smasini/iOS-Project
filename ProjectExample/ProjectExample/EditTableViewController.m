//
//  EditTableViewController.m
//  ProjectExample
//
//  Created by Simone on 02/09/15.
//  Copyright (c) 2015 bsdsoftware.it. All rights reserved.
//

#import "EditTableViewController.h"
#import "Database.h"
#import <ReactiveCocoa.h>
#import "Numero.h"

typedef void (^TestBlock)();

@interface EditTableViewController ()

@property (nonatomic, strong) TestBlock testBlock;

@end

@implementation EditTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.contatto){
        self.txtNome.text = self.contatto.nome;
        self.txtCognome.text = self.contatto.cognome;
        self.txtNumero.text = [[self.contatto.numeri anyObject] numero];
        self.txtEmail.text = self.contatto.email;
        self.txtIndirizzo.text = self.contatto.indirizzo;
    }
    
    RACSignal *segnaleCombinato = [RACSignal combineLatest:@[self.txtNome.rac_textSignal, self.txtCognome.rac_textSignal]];
    
    RAC(self.btnSalva, enabled) = [segnaleCombinato map:^id(RACTuple *tuple) {
        return @([tuple.first length] >= 3 && [tuple.second length] >= 3);
    }];
}

- (void)dealloc {
    NSLog(@"DEALLOC");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)salva:(id)sender {
    if(self.contatto){
        [self.database updateContatto:self.contatto.idContattoValue nome:self.txtNome.text cognome:self.txtCognome.text numero:self.txtNumero.text email:self.txtEmail.text indirizzo:self.txtIndirizzo.text];
    }else{
        [self.database aggiungiContatto:self.txtNome.text cognome:self.txtCognome.text numero:self.txtNumero.text email:self.txtEmail.text indirizzo:self.txtIndirizzo.text];
    }
    [self performSegueWithIdentifier:@"tornaContatti" sender:self];
}
@end
