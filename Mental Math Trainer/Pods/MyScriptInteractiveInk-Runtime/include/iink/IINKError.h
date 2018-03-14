// Copyright MyScript. All right reserved.

#import <Foundation/Foundation.h>

#if __has_attribute(ns_error_domain)
#undef NS_ERROR_ENUM
#define NS_ERROR_ENUM(type, name, domain) \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wignored-attributes\"") \
NS_ENUM(type, __attribute__((ns_error_domain(domain))) name) \
_Pragma("clang diagnostic pop")
#else
#undef NS_ERROR_ENUM
#define NS_ERROR_ENUM(type, name, domain) NS_ENUM(type, name)
#endif

/**
 * @constant IINKErrorDomain Indicates an IINK error.
 */
FOUNDATION_EXPORT NSErrorDomain _Nonnull const IINKErrorDomain;

/**
 @enum IINK-related Error Codes
 */
typedef NS_ERROR_ENUM(NSInteger, IINKError, IINKErrorDomain) {
    IINKErrorUnknown,          /**< Unknown failure. */
    IINKErrorRuntime,          /**< Runtime error. */
    IINKErrorOutOfRange,       /**< Accessing an element out of range. */
    IINKErrorInvalidArgument   /**< An argument value has not been accepted. */
};
