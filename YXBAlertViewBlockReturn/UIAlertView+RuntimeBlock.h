//
//  UIAlertView+RuntimeBlock.h
//  YXBAlertViewBlockReturn
//
//  Created by jglz on 16/5/6.
//  Copyright © 2016年 yxb. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^YXBAlertViewCallBackBlock)(NSInteger buttonIndex);
@interface UIAlertView (RuntimeBlock)
@property (nonatomic, copy) YXBAlertViewCallBackBlock alertViewCallBackBlock;




+(instancetype)alertWithCallBackBlock:(YXBAlertViewCallBackBlock)alertViewCallBackBlock title:(NSString *)title message:(NSString *)message  cancelButtonName:(NSString *)cancelButtonName otherButtonTitles:(NSString *)otherButtonTitles, ...;


@end
