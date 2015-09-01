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

@end
