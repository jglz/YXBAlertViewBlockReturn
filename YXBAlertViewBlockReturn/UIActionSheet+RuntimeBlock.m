//
//  UIActionSheet+RuntimeBlock.m
//  YXBAlertViewBlockReturn
//
//  Created by jglz on 16/5/6.
//  Copyright © 2016年 yxb. All rights reserved.
//

#import "UIActionSheet+RuntimeBlock.h"
#import <objc/runtime.h>
static void* YXBActionSheetKey = @"YXBActionSheetKey";
@interface UIActionSheet ()<UIActionSheetDelegate>
@end
@implementation UIActionSheet (RuntimeBlock)
+(void)actionSheetWithCallBackBlock:(YXBActionSheetCallBackBlock)alertViewCallBackBlock title:(NSString *)title message:(NSString *)message  cancelButtonName:(NSString *)cancelButtonName otherButtonTitles:(NSString *)otherButtonTitles, ...{

    UIActionSheet *sheet  = [[UIActionSheet alloc] initWithTitle:title delegate:nil cancelButtonTitle:cancelButtonName   destructiveButtonTitle:nil otherButtonTitles:otherButtonTitles, nil];
    NSString *other = nil;
    va_list args;
    if (otherButtonTitles) {
        va_start(args, otherButtonTitles);
        while ((other = va_arg(args, NSString*))) {
            [sheet addButtonWithTitle:other];
        }
        va_end(args);
    }
    sheet.actionSheetCallBackBlock = alertViewCallBackBlock;
    sheet.delegate = sheet;
    
    [sheet showInView:[[[UIApplication sharedApplication] delegate] window]];

}

-(void)setActionSheetCallBackBlock:(YXBActionSheetCallBackBlock)actionSheetCallBackBlock
{
    [self willChangeValueForKey:@"callbackBlock"];
    objc_setAssociatedObject(self, &YXBActionSheetKey, actionSheetCallBackBlock, OBJC_ASSOCIATION_COPY);
    [self didChangeValueForKey:@"callbackBlock"];
    
}

-(YXBActionSheetCallBackBlock)actionSheetCallBackBlock
{
    return objc_getAssociatedObject(self, &YXBActionSheetKey);
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.actionSheetCallBackBlock) {
        self.actionSheetCallBackBlock(buttonIndex);
    }
}
@end
