// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Contatto.m instead.

#import "_Contatto.h"

const struct ContattoAttributes ContattoAttributes = {
	.cognome = @"cognome",
	.email = @"email",
	.idContatto = @"idContatto",
	.indirizzo = @"indirizzo",
	.nome = @"nome",
};

const struct ContattoRelationships ContattoRelationships = {
	.numeri = @"numeri",
};

@implementation ContattoID
@end

@implementation _Contatto

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Contatto" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Contatto";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Contatto" inManagedObjectContext:moc_];
}

- (ContattoID*)objectID {
	return (ContattoID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"idContattoValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"idContatto"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic cognome;

@dynamic email;

@dynamic idContatto;

- (int32_t)idContattoValue {
	NSNumber *result = [self idContatto];
	return [result intValue];
}

- (void)setIdContattoValue:(int32_t)value_ {
	[self setIdContatto:@(value_)];
}

- (int32_t)primitiveIdContattoValue {
	NSNumber *result = [self primitiveIdContatto];
	return [result intValue];
}

- (void)setPrimitiveIdContattoValue:(int32_t)value_ {
	[self setPrimitiveIdContatto:@(value_)];
}

@dynamic indirizzo;

@dynamic nome;

@dynamic numeri;

- (NSMutableSet*)numeriSet {
	[self willAccessValueForKey:@"numeri"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"numeri"];

	[self didAccessValueForKey:@"numeri"];
	return result;
}

@end

