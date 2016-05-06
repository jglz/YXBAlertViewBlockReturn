//
//  UIActionSheet+RuntimeBlock.h
//  YXBAlertViewBlockReturn
//
//  Created by jglz on 16/5/6.
//  Copyright © 2016年 yxb. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^YXBActionSheetCallBackBlock)(NSInteger buttonIndex);
@interface UIActionSheet (RuntimeBlock)
@property (nonatomic, copy) YXBActionSheetCallBackBlock actionSheetCallBackBlock;
+(void)actionSheetWithCallBackBlock:(YXBActionSheetCallBackBlock)alertViewCallBackBlock title:(NSString *)title message:(NSString *)message  cancelButtonName:(NSString *)cancelButtonName otherButtonTitles:(NSString *)otherButtonTitles, ...;

@end
