//
//  YLWeatherEffectView.h
//  YLWeatherEffectViewDemo
//
//  Created by 肖 玉龙 on 15/3/12.
//  Copyright (c) 2015年 Yulong Xiao. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, YLWeatherEffectViewType) {
    YLWeatherEffectViewTypeRainy,
    YLWeatherEffectViewTypeSunny,
    YLWeatherEffectViewTypeCloudy,
    YLWeatherEffectViewTypeSnowy
};
@interface YLWeatherEffectView : UIView
-(id)initWithFrame:(CGRect)frame weatherType:(YLWeatherEffectViewType)weatherType NightTime:(BOOL) isNightTime;
@end
