// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Numero.h instead.

@import CoreData;

extern const struct NumeroAttributes {
	__unsafe_unretained NSString *numero;
	__unsafe_unretained NSString *tipo;
} NumeroAttributes;

extern const struct NumeroRelationships {
	__unsafe_unretained NSString *contatto;
} NumeroRelationships;

@class Contatto;

@interface NumeroID : NSManagedObjectID {}
@end

@interface _Numero : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) NumeroID* objectID;

@property (nonatomic, strong) NSString* numero;

//- (BOOL)validateNumero:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* tipo;

//- (BOOL)validateTipo:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Contatto *contatto;

//- (BOOL)validateContatto:(id*)value_ error:(NSError**)error_;

@end

@interface _Numero (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveNumero;
- (void)setPrimitiveNumero:(NSString*)value;

- (NSString*)primitiveTipo;
- (void)setPrimitiveTipo:(NSString*)value;

- (Contatto*)primitiveContatto;
- (void)setPrimitiveContatto:(Contatto*)value;

@end
