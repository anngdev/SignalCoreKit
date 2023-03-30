//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
//

#import "Randomness.h"

NS_ASSUME_NONNULL_BEGIN

@implementation Randomness

+ (NSData *)generateRandomBytes:(int)numberBytes
{
    NSMutableData *_Nullable randomBytes = [NSMutableData dataWithLength:numberBytes];
    int err = 0;
    err = SecRandomCopyBytes(kSecRandomDefault, numberBytes, [randomBytes mutableBytes]);

    NSData *copy = [randomBytes copy];

    return copy;
}

@end

NS_ASSUME_NONNULL_END
