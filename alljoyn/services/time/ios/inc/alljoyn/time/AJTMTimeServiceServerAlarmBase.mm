/******************************************************************************
 * Copyright AllSeen Alliance. All rights reserved.
 *
 *    Permission to use, copy, modify, and/or distribute this software for any
 *    purpose with or without fee is hereby granted, provided that the above
 *    copyright notice and this permission notice appear in all copies.
 *
 *    THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 *    WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 *    MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 *    ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 *    WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 *    ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 *    OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 ******************************************************************************/

/**
 * This class is experimental, and as such has not been tested.
 * Please help make it more robust by contributing fixes if you find issues
 **/

#import "AJTMTimeServiceServerAlarmBase.h"

@interface AJTMTimeServiceServerAlarmBase ()
@property AJTMTimeServiceServerAlarmAdapter* handle;
@end

@implementation AJTMTimeServiceServerAlarmBase

-(id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

-(void)registerAdapter:(AJTMTimeServiceServerAlarmAdapter*) adapter
{
    self.handle = adapter;
}

-(void)releaseObject
{
    if (self.handle == nil) {
        return NSLog(@"Alarm handle is nil");
    }
    self.handle->release();
}

-(NSString*)objectPath
{
    if (self.handle == nil) {
        NSLog(@"Alarm handle is nil");
        return @"";
    }
    return @((self.handle->getObjectPath()).c_str());
}

-(QStatus)alarmReached
{
    return self.handle->alarmReached();
}

-(id)getHandle
{
    return (id)self.handle;
}



@end
