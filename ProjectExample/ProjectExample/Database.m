//
//  Database.m
//  ProjectExample
//
//  Created by Simone on 01/09/15.
//  Copyright (c) 2015 bsdsoftware.it. All rights reserved.
//

#import "Database.h"
#import <FMDB.h>
#import "Contatto.h"

@interface Database ()
@property(nonatomic, strong) FMDatabase *db;
@end

@implementation Database

-(instancetype)init {
    self = [super init];
    if (self) {
         self.db = [FMDatabase databaseWithPath:@"/tmp/tmp.db"];
    }
    return self;
}

- (void)creaTabelle {
    
    [self.db executeStatements:@"CREATE TABLE IF NOT EXISTS Contatti (ID int PRIMARY KEY, Nome TEXT, Cognome TEXT, Numero TEXT, Email TEXT, Indirizzo TEXT);"];
    
  /*  [self.db executeStatements:@"INSERT INTO Contatti VALUES(1, 'Simone', 'Masini', '07654567', 'smasini@bsdsoftware.it', 'via montiano');"];*/
    
}

- (void)connetti {
    BOOL isOpen = [self.db open];
    if(!isOpen){
        @throw [NSException exceptionWithName:@"DBError" reason:@"Impossibile aprire il db" userInfo:nil];
    }
    [self creaTabelle];
}

- (void)disconnetti {
    [self.db close];
}

- (NSArray *)tuttiContatti {
    FMResultSet *result = [self.db executeQuery:@"SELECT * FROM Contatti"];
    NSMutableArray *contatti = [NSMutableArray array];
    while ([result next]) {
        Contatto *contatto = [[Contatto alloc]init];
        contatto.id = [result intForColumn:@"ID"];
        contatto.nome = [result stringForColumn:@"Nome"];
        contatto.cognome = [result stringForColumn:@"Cognome"];
        contatto.numero = [result stringForColumn:@"Numero"];
        contatto.email = [result stringForColumn:@"Email"];
        contatto.indirizzo = [result stringForColumn:@"Indirizzo"];
        
        [contatti addObject:contatto];
    }
    [result close];
    return contatti;
}

@end
