// Copyright MyScript. All right reserved.

#import <Foundation/Foundation.h>


/**
 * Represents a set of parameters values.
 */
@interface IINKParameterSet : NSObject
{

}

/**
 * Injects JSON content into this parameter set.
 *
 * @param jsonText JSON parameters values.
 * @param error the recipient for the error description object
 *   * IINKErrorInvalidArgument when jsonText is not valid JSON.
 * @return `YES` on success, otherwise `NO`.
 */
- (BOOL)inject:(nonnull NSString *)jsonText
     error:(NSError * _Nullable * _Nullable)error;

/**
 * Returns the string value associated with `key`.
 *
 * @param key the key of the value to obtain.
 * @param error the recipient for the error description object
 *   * IINKErrorInvalidArgument when `key` is not found.
 *   * IINKErrorRuntime when entry at `key` is not a string.
 * @return the value if present, otherwise `nil`.
 */
- (nullable NSString *)getString:(nonnull NSString *)key
                       error:(NSError * _Nullable * _Nullable)error;

/**
 * Returns the string value associated with `key`.
 *
 * @param key the key of the value to obtain.
 * @param defaultValue the value to return when `key` is not present.
 * @return the value.
 */
- (nonnull NSString *)getString:(nonnull NSString *)key
                        orValue:(nonnull NSString *)defaultValue;

/**
 * Sets the string value associated with `key`.
 *
 * @param key the key of the value to set.
 * @param value the string value to set.
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when entry at `key` exists and is not a string.
 * @return `YES` on success, otherwise `NO`.
 */
- (BOOL)setString:(nonnull NSString *)key
            value:(nonnull NSString *)value
        error:(NSError * _Nullable * _Nullable)error;

/**
 * Returns the boolean value associated with `key`.
 *
 * @param key the key of the value to obtain.
 * @param error the recipient for the error description object
 *   * IINKErrorInvalidArgument when `key` is not found.
 *   * IINKErrorRuntime when entry at `key` is not a boolean.
 * @return the value if present, otherwise `nil`.
 */
- (BOOL)getBoolean:(nonnull NSString *)key
         error:(NSError * _Nullable * _Nullable)error;

/**
 * Returns the boolean value associated with `key`.
 *
 * @param key the key of the value to obtain.
 * @param defaultValue the value to return when `key` is not present.
 * @return the value.
 */
- (BOOL)getBoolean:(nonnull NSString *)key orValue:(BOOL)defaultValue;

/**
 * Sets the boolean value associated with `key`.
 *
 * @param key the key of the value to set.
 * @param value the boolean value to set.
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when entry at `key` exists and is not a boolean.
 * @return `YES` on success, otherwise `NO`.
 */
- (BOOL)setBoolean:(nonnull NSString *)key value:(BOOL)value
         error:(NSError * _Nullable * _Nullable)error;

/**
 * Returns the numeric value associated with `key`.
 *
 * @param key the key of the value to obtain.
 * @param error the recipient for the error description object
 *   * IINKErrorInvalidArgument when `key` is not found.
 *   * IINKErrorRuntime when entry at `key` is not a number.
 * @return the value if present, otherwise `NAN.`.
 */
- (double)getNumber:(nonnull NSString *)key
          error:(NSError * _Nullable * _Nullable)error;

/**
 * Returns the numeric value associated with `key`.
 *
 * @param key the key of the value to obtain.
 * @param defaultValue the value to return when `key` is not present.
 * @return the value.
 */
- (double)getNumber:(nonnull NSString *)key orValue:(double)defaultValue;

/**
 * Sets the numeric value associated with `key`.
 *
 * @param key the key of the value to set.
 * @param value the double value to set.
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when entry at `key` exists and is not a number.
 * @return `YES` on success, otherwise `NO`.
 */
- (BOOL)setNumber:(nonnull NSString *)key value:(double)value
        error:(NSError * _Nullable * _Nullable)error;

/**
 * Returns the string array value associated with `key`.
 *
 * @param key the key of the value to obtain.
 * @param error the recipient for the error description object
 *   * IINKErrorInvalidArgument when `key` is not found.
 *   * IINKErrorRuntime when entry at `key` is not a string array.
 * @return the value on success, otherwise `nil`.
 */
- (nullable NSArray<NSString *> *)getStringArray:(nonnull NSString *)key
                          error:(NSError * _Nullable * _Nullable)error;

/**
 * Sets the string array value associated with `key`.
 *
 * @param key the key of the value to set.
 * @param value the value to set.
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when entry at `key` exists and is not a string array.
 * @return `YES` on success, otherwise `NO`.
 */
- (BOOL)setStringArray:(nonnull NSString *)key value:(nonnull NSArray<NSString *> *)value
             error:(NSError * _Nullable * _Nullable)error;

/**
 * Returns a parameter set object representing the section associated with
 * `key`. Sections correspond to the hierarchical organization of keys
 * according to their dots. For example, if you have keys "a.b.c" and "a.b.d"
 * there is a section "a.b" that contains keys "c" and "d", as well as a
 * section "a" containing "b.c" and "b.d".
 *
 * @param key the key of the section to obtain.
 * @param error the recipient for the error description object
 *   * IINKErrorInvalidArgument when `key` is not found.
 *   * IINKErrorRuntime when entry at `key` is not a section.
 * @return the section on success, otherwise `nil`.
 */
- (nullable IINKParameterSet *)getSection:(nonnull NSString *)key
                                error:(NSError * _Nullable * _Nullable)error;

@end
