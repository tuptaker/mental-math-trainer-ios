// Copyright MyScript. All right reserved.

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, IINKMimeType)
{
  IINKMimeTypeText,     /**< Plain text (text/plain). */
  IINKMimeTypeHTML,     /**< HyperText Markup Language (text/html) */
  IINKMimeTypeMathML,   /**< Mathematical Markup Language (application/mathml+xml). */
  IINKMimeTypeLaTeX,    /**< LaTeX (application/x-latex). */
  IINKMimeTypeGraphML,  /**< Graph Markup Language (application/graphml+xml). */
  IINKMimeTypeMusicXML, /**< Music Extensible Markup Language (application/vnd.recordare.musicxml+xml). */
  IINKMimeTypeSVG,      /**< Scalable Vector Graphics (image/svg+xml). */
  IINKMimeTypeJIIX,     /**< Json Interactive Ink eXchange format (application/vnd.myscript.jiix). */
  IINKMimeTypeJPEG,     /**< JPEG Image (image/jpeg). */
  IINKMimeTypePNG,      /**< PNG Image (image/png). */
  IINKMimeTypeGIF,      /**< GIF Image (image/gif). */
  IINKMimeTypePDF,      /**< Portable Document Format (application/pdf). */
  IINKMimeTypeDOCX,     /**< Open XML word processing document (application/vnd.openxmlformats-officedocument.wordprocessingml.document). */
  IINKMimeTypePPTX,     /**< Open XML presentation (application/vnd.openxmlformats-officedocument.presentationml.presentation). */
  IINKMimeTypeOfficeClipboard /**< Microsoft Office Clipboard format (Art::GVML ClipFormat). @since 1.1 */
};


/**
 * Wrapper object for an `IINKMimeType` value.
 */
@interface IINKMimeTypeValue : NSObject
{

}

@property (nonatomic) IINKMimeType value;

/**
 * Create a new `IINKMimeTypeValue` instance.
 * @param value the mime type value.
 */
- (nullable instancetype)initWithValue:(IINKMimeType)value;

/**
 * Builds a new `IINKMimeTypeValue` instance.
 * @param value the mime type value.
 */
+ (nonnull IINKMimeTypeValue *)valueWithMimeType:(IINKMimeType)value;


//==============================================================================
#pragma mark - Utilities
//==============================================================================

/**
 * Returns a descriptive name in English.
 *
 * @param mimeType the MIME type.
 *
 * @return the descriptive name
 */
+ (NSString * _Nonnull)IINKMimeTypeGetName:(IINKMimeType)mimeType;

/**
 * Returns the name of the media type, in the form "type/subtype".
 *
 * @param mimeType the MIME type.
 *
 * @return the name of the media type.
 */
+ (NSString * _Nonnull)IINKMimeTypeGetTypeName:(IINKMimeType)mimeType;

/**
 * Returns a comma separated list of file extensions.
 *
 * @param mimeType the MIME type.
 *
 * @return the file extensions, or <code>null</code>
 */
+ (NSString * _Nonnull)IINKMimeTypeGetFileExtensions:(IINKMimeType)mimeType;

/**
 * Tells whether the specified MIME type is textual.
 *
 * @param mimeType the MIME type.
 *
 * @return `true` if the MIME type is textual, `false` otherwise.
 */
+ (BOOL)IINKMimeTypeIsTextual:(IINKMimeType)mimeType;

/**
 * Tells whether the specified MIME type is an image MIME type.
 *
 * @param mimeType the MIME type.
 *
 * @return `true` if the MIME type is an image MIME type, `false` otherwise.
 */
+ (BOOL)IINKMimeTypeIsImage:(IINKMimeType)mimeType;

@end
