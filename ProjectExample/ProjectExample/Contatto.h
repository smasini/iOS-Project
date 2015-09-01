//
//  Contatto.h
//  ProjectExample
//
//  Created by Simone on 01/09/15.
//  Copyright (c) 2015 bsdsoftware.it. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contatto : NSObject

@property(nonatomic, assign) NSInteger id;
@property(nonatomic, strong) NSString *nome;
@property(nonatomic, strong) NSString *cognome;
@property(nonatomic, strong) NSString *numero;
@property(nonatomic, strong) NSString *email;
@property(nonatomic, strong) NSString *indirizzo;

@end
