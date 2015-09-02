//
//  Database.m
//  ProjectExample
//
//  Created by Simone on 01/09/15.
//  Copyright (c) 2015 bsdsoftware.it. All rights reserved.
//

#import "Database.h"
#import "Contatto.h"
#import "Numero.h"

@interface Database ()
@property(nonatomic, strong) NSManagedObjectContext *context;
@end

@implementation Database

-(instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void) connetti{
    self.context = [NSManagedObjectContext MR_context];
}

- (void)disconnetti{
    self.context = nil;
}

- (void)aggiungiContatto:(NSString *)nome cognome:(NSString *)cognome numero:(NSString *)numero email:(NSString *)email indirizzo:(NSString *)indirizzo {
    Contatto *contatto = [Contatto MR_createEntityInContext:self.context];
    contatto.nome = nome;
    contatto.cognome = cognome;
    contatto.indirizzo = indirizzo;
    contatto.email = email;
    Numero *num = [Numero MR_createEntityInContext:self.context];
    num.numero = numero;
    num.tipo = @"Tel;";
    [contatto addNumeriObject:num];
    //contatto.numero = numero;
    //contatto.fax = @"asd";
    NSUInteger count = [Contatto MR_countOfEntitiesWithContext:self.context];
    contatto.idContattoValue = (int) count;
    
    [self.context MR_saveToPersistentStoreAndWait];
    
}

- (void)updateContatto:(NSInteger) key nome:(NSString *)nome cognome:(NSString *)cognome numero:(NSString *)numero email:(NSString *)email indirizzo:(NSString *)indirizzo {
    Contatto *contatto = [Contatto MR_findFirstByAttribute:@"idContatto" withValue:@(key) inContext:self.context];
    contatto.nome = nome;
    contatto.cognome = cognome;
    contatto.indirizzo = indirizzo;
    contatto.email = email;
    Numero *num = [Numero MR_createEntityInContext:self.context];
    num.numero = numero;
    num.tipo = @"Tel;";
    [contatto addNumeriObject:num];
    
    [self.context MR_saveToPersistentStoreAndWait];
}

- (void)eliminaContatto:(NSInteger)key {
    Contatto *contatto = [Contatto MR_findFirstByAttribute:@"idContatto" withValue:@(key) inContext:self.context];
    [contatto MR_deleteEntityInContext:self.context];
}



- (NSArray *)tuttiContatti {

    return [Contatto MR_findAllInContext:self.context];
    
}

@end
