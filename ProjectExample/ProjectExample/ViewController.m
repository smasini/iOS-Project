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
#import "EditTableViewController.h"
#import "Numero.h"

@interface ViewController ()

@property(nonatomic, strong) NSArray *contatti;
@end

typedef void (^CallbackBlock)();

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableContatti.rowHeight = UITableViewAutomaticDimension;
    self.tableContatti.estimatedRowHeight = 44;
    self.tableContatti.allowsMultipleSelectionDuringEditing = NO;
    self.database = [Database new];
    [self.database connetti];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(voceDiMenuCambiata:) name:@"VoceMenuSelezionata" object:nil];
}

- (void)caricaContatti:(CallbackBlock)callback {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        self.contatti = [self.database tuttiContatti];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            callback();
        });
        
    });
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"ESEGUITO UNA SOLA VOLTA %@", @":)");
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"ESEGUITO DOPO 3 SECONDI!!!");
    });
}

- (void)voceDiMenuCambiata:(NSNotification *)not {
    NSDictionary *parametro = not.object;
    NSInteger idx = [parametro[@"idx"] intValue];
    [[[UIAlertView alloc] initWithTitle:@"Menu" message:[NSString stringWithFormat:@"Voce di menu selezionata: %d", idx] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [self.database disconnetti];
    self.database = nil;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self caricaContatti:^{
        [self.tableContatti reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contatti count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContattoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellacontatto2" forIndexPath:indexPath];
    Contatto *contatto = self.contatti[indexPath.row];
    cell.lblNome.text = contatto.nome;
    cell.lblNumero.text = [[contatto.numeri anyObject] numero];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"editcontatto"]){
        ((EditTableViewController *) segue.destinationViewController).database = self.database;
    }else if([segue.identifier isEqualToString:@"editcontattoesistente"]){
        ((EditTableViewController *) segue.destinationViewController).database = self.database;
        NSInteger index = [self.tableContatti indexPathForSelectedRow].row;
        ((EditTableViewController *) segue.destinationViewController).contatto = self.contatti[index];
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.database eliminaContatto: ((Contatto *)self.contatti[indexPath.row]).idContattoValue];
        [self caricaContatti:^{
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation: UITableViewRowAnimationFade];
        }];
    }
}

-(IBAction)ritornaDaEdit:(UIStoryboardSegue *) segue{
    
}

@end
