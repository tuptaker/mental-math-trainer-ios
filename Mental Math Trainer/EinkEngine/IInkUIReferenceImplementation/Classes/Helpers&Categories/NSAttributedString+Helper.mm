// Copyright MyScript. All right reserved.

#import "NSAttributedString+Helper.h"
#import <CoreText/CoreText.h>
#import <iink/text/IINKText.h>
#import <iink/text/IINKTextSpan.h>
#import "UIfont+Helper.h"

@implementation NSAttributedString (Helper)

- (NSArray<NSValue *> *)charactersBoundingBoxers
{
    BOOL takeOffset = [self shouldTakeOffset];

    NSMutableArray<NSValue *> *charBoxes = [[NSMutableArray alloc] initWithCapacity:self.length];
    
    CTLineRef line = CTLineCreateWithAttributedString((CFAttributedStringRef)self);
    CFArrayRef runArray = CTLineGetGlyphRuns(line);
    
    CFIndex runCount = CFArrayGetCount(runArray);
    int charIndex = 0;
    for (int runIndex = 0; runIndex < runCount; ++runIndex)
    {
        CTRunRef run = (CTRunRef)CFArrayGetValueAtIndex(runArray, runIndex);
        CFIndex glyphCount = CTRunGetGlyphCount(run);
        CGFloat charOffset = takeOffset ? CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(run).location, NULL) : 0;
        
        // Calculate the bounding box for all characters
        for (int glyphIndex = 0; glyphIndex < glyphCount; ++glyphIndex)
        {
            CFRange thisGlyphRange = CFRangeMake(glyphIndex, 1);
            CGRect glyphRect = CTRunGetImageBounds(run, NULL, thisGlyphRange);
            
            CGRect rect = CGRectMake(glyphRect.origin.x + charOffset, - glyphRect.origin.y - glyphRect.size.height, glyphRect.size.width, glyphRect.size.height);
            charBoxes[charIndex] = [NSValue valueWithCGRect:rect];
            charIndex++;
        }
    }
    
    CFRelease(line);
    
    return charBoxes;
}

+ (NSAttributedString *)attributedStringWithText:(IINKText *)label
                                          spans:(NSArray<IINKTextSpan *> *)spans
{
    NSMutableAttributedString *completeAttributedString = [[NSMutableAttributedString alloc] initWithString:label.label];
    
    
    // Construct the line with all styles inside
    NSInteger beginCharPosition = 0;
    NSInteger charCount = 0;
    for (int index = 0; index < (int)spans.count; ++index)
    {
        IINKTextSpan *span = spans[index];
        beginCharPosition = span.beginPosition;
        if (index + 1 < (int)spans.count)
            charCount = spans[index + 1].beginPosition - span.beginPosition +1;
        else
            charCount = span.endPosition - span.beginPosition;

        NSRange subrange = [completeAttributedString.string rangeOfComposedCharacterSequenceAtIndex:beginCharPosition];
        NSRange range = NSMakeRange(beginCharPosition, charCount);
        NSRange fullRange = NSUnionRange(subrange, range);
        
        UIFont *newFont = [UIFont fontFromStyle:span.style];
        NSDictionary *dict = @{
                               (NSString *)kCTFontAttributeName: newFont,
                               NSLigatureAttributeName : @(0) // No ligatures
                               };
        
        [completeAttributedString setAttributes:dict range:fullRange];
    }
    return completeAttributedString;
}

#pragma mark - Private methods

- (BOOL)shouldTakeOffset
{
    BOOL takeOffset = YES;
    NSString *SDKName = [[NSBundle mainBundle] infoDictionary][@"DTSDKName"];
    NSCharacterSet *characterSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSPredicate *lengthPredicate = [NSPredicate predicateWithFormat:@"length != 0"];
    NSArray *components = [[SDKName componentsSeparatedByCharactersInSet:characterSet] filteredArrayUsingPredicate:lengthPredicate];
    NSString *majorVersion = components.count > 0 ? components[0] : @"";

    if (majorVersion.integerValue >= 11)
    {
        // With Xcode 9 and device version >= 11, `CTRunGetImageBounds`
        // alreaday takes the char offset between runs into account
        NSOperatingSystemVersion minimumVersion;
        minimumVersion.majorVersion = 11;
        minimumVersion.minorVersion = 0;
        minimumVersion.patchVersion = 0;
        takeOffset = ![[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion: minimumVersion];
    }

    return takeOffset;
}

@end

