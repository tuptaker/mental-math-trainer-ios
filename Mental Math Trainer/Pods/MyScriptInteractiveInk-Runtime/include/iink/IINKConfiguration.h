// Copyright MyScript. All right reserved.

#import <Foundation/Foundation.h>
#import <iink/IINKParameterSet.h>
#import <iink/IINKConfigurationDelegate.h>


/**
 * Represents the configuration values of the iink runtime environment.
 */
@interface IINKConfiguration : IINKParameterSet

//==============================================================================
#pragma mark - Delegate
//==============================================================================

/**
 * The delegate that will receive configuration change events.
 */
@property (nonatomic, weak, nullable) id<IINKConfigurationDelegate> delegate;

/**
 * Adds a delegate to this editor without changing the `delegate` property.
 * @param delegate the delegate to add.
 */
- (void)addDelegate:(nonnull id<IINKConfigurationDelegate>)delegate;

/**
 * Removes a delegate added by `addDelegate:`
 * @param delegate the delegate to remove.
 */
- (void)removeDelegate:(nonnull id<IINKConfigurationDelegate>)delegate;

@end
