//
//  NSNotificationCenter+Menu.m
//  ProjectExample
//
//  Created by Simone on 02/09/15.
//  Copyright (c) 2015 bsdsoftware.it. All rights reserved.
//

#import "NSNotificationCenter+Menu.h"

@implementation NSNotificationCenter (Menu)

- (void)inviaNotificaPerVoceDiMenuConIndice:(NSInteger)idx {
    [self postNotificationName:@"VoceMenuSelezionata" object:@{@"idx": @(idx)}];
}

@end
