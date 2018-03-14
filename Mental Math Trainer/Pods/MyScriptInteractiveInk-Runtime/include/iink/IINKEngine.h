// Copyright MyScript. All right reserved.

#import <Foundation/Foundation.h>
#import <iink/IINKIRenderTarget.h>

@class IINKConfiguration;
@class IINKRenderer;
@class IINKEditor;
@class IINKContentPackage;


/**
 * Represents the iink runtime environment.
 */
@interface IINKEngine : NSObject
{

}

//==============================================================================
#pragma mark - Properties
//==============================================================================

/**
 * The configuration associated with this engine.
 */
@property (nonatomic, readonly, nonnull) IINKConfiguration *configuration;

/**
 * Lists the part types supported by this editor.
 *
 * @return the list of supported part types.
 */
@property (nonatomic, readonly, nonnull) NSArray<NSString *> *supportedPartTypes;


//==============================================================================
#pragma mark - Constructors
//==============================================================================

/**
 * Create a new `Engine` instance.
 * @param aCertificate certificate bytes data.
 */
- (nullable instancetype)initWithCertificate:(nonnull NSData *)aCertificate;


//==============================================================================
#pragma mark - Factories
//==============================================================================

/**
 * Creates a new renderer.
 *
 * @param dpiX the physical horizontal resolution of the display in dots per
 *   inch.
 * @param dpiY the physical vertical resolution of the display in dots per
 *   inch.
 * @param target the render target on success, otherwise `nil`.
 * @return the newly created renderer.
 */
- (nonnull IINKRenderer *)createRendererWithDpiX:(float)dpiX dpiY:(float)dpiY target:(nullable id<IINKIRenderTarget>)target;

/**
 * Creates a new editor.
 *
 * @param renderer the renderer to be used to display editor's content.
 * @return the newly created editor on success, otherwise `nil`.
 */
- (nullable IINKEditor *)createEditor:(nonnull IINKRenderer *)renderer;


//==============================================================================
#pragma mark - Package Management
//==============================================================================

/**
 * Creates a new package.
 *
 * @param fileName the package file.
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when a package with associated fileName already exists.
 *   * IINKErrorRuntime when an I/O operation fails.
 *   * IINKErrorInvalidArgument when a package associated with the same
 *   fileName is already opened, it can be accessed via a call to openPackage().
 * @return the package on success, otherwise `nil`.
 */
- (nullable IINKContentPackage *)createPackage:(nonnull NSString *)fileName
                                     error:(NSError * _Nullable * _Nullable)error;

/**
 * Opens the specified package.
 *
 * @param fileName the package file.
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when a package with associated fileName does not exist.
 *   * IINKErrorRuntime when an I/O operation fails.
 * @return the package on success, otherwise `nil`.
 */
- (nullable IINKContentPackage *)openPackage:(nonnull NSString *)fileName
                                   error:(NSError * _Nullable * _Nullable)error;

@end
