// Copyright MyScript. All right reserved.

#import <Foundation/Foundation.h>


@class IINKContentPart;
@class IINKParameterSet;

/**
 * A package stores the user content as a sorted collection of parts.
 *
 * @see `IINKContentPart`.
 */
@interface IINKContentPackage : NSObject
{

}

//==============================================================================
#pragma mark - Properties
//==============================================================================

/**
 * This package's metadata as a parameter set.
 */
@property (nonatomic, nullable) IINKParameterSet *metadata;


//==============================================================================
#pragma mark - Save
//==============================================================================

/**
 * Saves all ongoing modifications made to this package.
 *
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when an I/O operation fails.
 * @return `YES` on success, otherwise `NO`.
 */
- (BOOL)saveWithError:(NSError * _Nullable * _Nullable)error;

/**
 * Saves all ongoing modifications made to this package, to a temporary folder.
 * This operation is faster than `save()`.
 *
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when an I/O operation fails.
 * @return `YES` on success, otherwise `NO`.
 *
 * @note by default temporary folder is located in the same directory as this
 *   package, and named by appending `-files` to this package's name.
 *
 * @note temporary folder location can be set via the
 *   `content-package.temp-folder` configuration property.
 */
- (BOOL)saveToTempWithError:(NSError * _Nullable * _Nullable)error;

/**
 * Saves of all ongoing modifications made to this package, to a new file.
 *
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when an I/O operation fails.
 * @return `YES` on success, otherwise `NO`.
 *
 * @param fileName the new file name.
 */
- (BOOL)saveAs:(nonnull NSString *)fileName
     error:(NSError * _Nullable * _Nullable)error;


//==============================================================================
#pragma mark - Part Management
//==============================================================================

/**
 * Returns the number of parts in this package.
 */
- (NSInteger)partCount;

/**
 * Returns the part at the specified index.
 *
 * @param index the index of the requested part.
 * @param error the recipient for the error description object
 *   * IINKErrorOutOfRange when `index` is out of range.
 * @return the requested part on success, otherwise `nil`.
 */
- (nullable IINKContentPart *)getPartAt:(NSInteger)index
                              error:(NSError * _Nullable * _Nullable)error;

/**
 * Returns the specified part.
 *
 * @param identifier the identifier of the requested part.
 * @param error the recipient for the error description object
 *   * IINKErrorInvalidArgument when no part is associated with identifier `id`.
 * @return the part on success, otherwise `nil`..
 */
- (nullable IINKContentPart *)getPart:(nonnull NSString *)identifier
                            error:(NSError * _Nullable * _Nullable)error;

/**
 * Returns the index of a given part.
 *
 * @param part the part.
 * @param error the recipient for the error description object
 *   * IINKErrorInvalidArgument when part does not belong to this package.
 * @return the index of the part on success, otherwise `-1`.
 */
- (NSInteger)indexOfPart:(nonnull IINKContentPart *)part
               error:(NSError * _Nullable * _Nullable)error;

/**
 * Appends a new part to this package.
 *
 * @param type the type of part.
 * @param error the recipient for the error description object
 *   * IINKErrorInvalidArgument when `type` is not a valid ContentPart type.
 * @return the newly created part on success, otherwise `nil`.
 */
- (nullable IINKContentPart *)createPart:(nonnull NSString *)type
                               error:(NSError * _Nullable * _Nullable)error;

//==============================================================================
#pragma mark - Objects
//==============================================================================

/**
 * Extracts an object from this package to a given path.
 *
 * @param error the recipient for the error description object
 *   * IINKErrorInvalidArgument when no object named `url` exists.
 *   * IINKErrorRuntime when an I/O operation fails.
 * @return `YES` on success, otherwise `NO`.
 *
 * @param url URL of the object.
 * @param fileName destination file.
 */
- (BOOL)extractObject:(nonnull NSString *)url
               toFile:(nonnull NSString *)fileName
            error:(NSError * _Nullable * _Nullable)error;

@end
