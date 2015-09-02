// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Contatto.h instead.

@import CoreData;

extern const struct ContattoAttributes {
	__unsafe_unretained NSString *cognome;
	__unsafe_unretained NSString *email;
	__unsafe_unretained NSString *idContatto;
	__unsafe_unretained NSString *indirizzo;
	__unsafe_unretained NSString *nome;
} ContattoAttributes;

extern const struct ContattoRelationships {
	__unsafe_unretained NSString *numeri;
} ContattoRelationships;

@class Numero;

@interface ContattoID : NSManagedObjectID {}
@end

@interface _Contatto : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ContattoID* objectID;

@property (nonatomic, strong) NSString* cognome;

//- (BOOL)validateCognome:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* email;

//- (BOOL)validateEmail:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* idContatto;

@property (atomic) int32_t idContattoValue;
- (int32_t)idContattoValue;
- (void)setIdContattoValue:(int32_t)value_;

//- (BOOL)validateIdContatto:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* indirizzo;

//- (BOOL)validateIndirizzo:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* nome;

//- (BOOL)validateNome:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *numeri;

- (NSMutableSet*)numeriSet;

@end

@interface _Contatto (NumeriCoreDataGeneratedAccessors)
- (void)addNumeri:(NSSet*)value_;
- (void)removeNumeri:(NSSet*)value_;
- (void)addNumeriObject:(Numero*)value_;
- (void)removeNumeriObject:(Numero*)value_;

@end

@interface _Contatto (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveCognome;
- (void)setPrimitiveCognome:(NSString*)value;

- (NSString*)primitiveEmail;
- (void)setPrimitiveEmail:(NSString*)value;

- (NSNumber*)primitiveIdContatto;
- (void)setPrimitiveIdContatto:(NSNumber*)value;

- (int32_t)primitiveIdContattoValue;
- (void)setPrimitiveIdContattoValue:(int32_t)value_;

- (NSString*)primitiveIndirizzo;
- (void)setPrimitiveIndirizzo:(NSString*)value;

- (NSString*)primitiveNome;
- (void)setPrimitiveNome:(NSString*)value;

- (NSMutableSet*)primitiveNumeri;
- (void)setPrimitiveNumeri:(NSMutableSet*)value;

@end
