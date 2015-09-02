//
//  Database.h
//  ProjectExample
//
//  Created by Simone on 01/09/15.
//  Copyright (c) 2015 bsdsoftware.it. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Database : NSObject

@property (nonatomic, assign, getter=isOpen) BOOL open;

- (void)connetti;
- (void)disconnetti;
- (NSArray *) tuttiContatti;
- (void) aggiungiContatto:(NSString *)nome cognome:(NSString *)cognome numero:(NSString *)numero email:(NSString *) email indirizzo:(NSString *)indirizzo;
- (void)updateContatto:(NSInteger) key nome:(NSString *)nome cognome:(NSString *)cognome numero:(NSString *)numero email:(NSString *)email indirizzo:(NSString *)indirizzo;

- (void) eliminaContatto:(NSInteger) key;
@end
