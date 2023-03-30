//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
//

#import "OWSLogs.h"
#import <stdatomic.h>

NS_ASSUME_NONNULL_BEGIN

@implementation OWSLogger

+ (void)verbose:(NSString *)logString
{
}

+ (void)debug:(NSString *)logString
{
}

+ (void)info:(NSString *)logString
{
    if (self.aggressiveFlushing) {
        [self flush];
    }
}

+ (void)warn:(NSString *)logString
{
    if (self.aggressiveFlushing) {
        [self flush];
    }
}

+ (void)error:(NSString *)logString
{
    if (self.aggressiveFlushing) {
        [self flush];
    }
}

+ (void)flush
{
}

static _Atomic BOOL _aggressiveLogFlushingEnabled = ATOMIC_VAR_INIT(NO);

+ (BOOL)aggressiveFlushing
{
    return atomic_load(&_aggressiveLogFlushingEnabled);
}

+ (void)setAggressiveFlushing:(BOOL)isEnabled
{
    if (atomic_exchange(&_aggressiveLogFlushingEnabled, isEnabled) != isEnabled) {
        [self warn:[NSString stringWithFormat:@"%@ aggressive log flushing", isEnabled ? @"Enabled" : @"Disabled"]];
    }
}

@end

NS_ASSUME_NONNULL_END
