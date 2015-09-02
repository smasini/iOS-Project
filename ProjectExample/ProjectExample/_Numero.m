// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Numero.m instead.

#import "_Numero.h"

const struct NumeroAttributes NumeroAttributes = {
	.numero = @"numero",
	.tipo = @"tipo",
};

const struct NumeroRelationships NumeroRelationships = {
	.contatto = @"contatto",
};

@implementation NumeroID
@end

@implementation _Numero

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Numero" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Numero";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Numero" inManagedObjectContext:moc_];
}

- (NumeroID*)objectID {
	return (NumeroID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic numero;

@dynamic tipo;

@dynamic contatto;

@end

