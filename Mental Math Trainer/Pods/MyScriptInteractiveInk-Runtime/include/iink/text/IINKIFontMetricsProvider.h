// Copyright MyScript. All right reserved.

#import <Foundation/Foundation.h>
#import <iink/text/IINKTextSpan.h>
#import <iink/text/IINKText.h>
#import <iink/graphics/IINKStyle.h>


/**
 * Provides measurements of text rendered by fonts on the target display.
 */
@protocol IINKIFontMetricsProvider <NSObject>

@required

/**
 * Returns the bounding box of each glyph of the specified text as if it were
 * displayed at 0,0 using the specified styles.
 *
 * @param text the text.
 * @param spans an array of glyph intervals with associated style.
 * @return the bounding boxes (array of NSValue holding CGRect).
 */
- (NSArray<NSValue *> *)getCharacterBoundingBoxes:(IINKText *)text spans:(NSArray<IINKTextSpan *> *)spans;

/**
 * Returns the size of the specified font in pixels. On input the font size is
 * expressed in logical units as specified by the platform.
 *
 * @param style the style that specifies the font.
 * @return the size of the font in pixels.
 */
- (float)getFontSizePx:(IINKStyle *)style;

@end
