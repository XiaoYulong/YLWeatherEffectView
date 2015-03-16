//
//  YLWeatherEffectView.m
//  YLWeatherEffectViewDemo
//
//  Created by 肖 玉龙 on 15/3/12.
//  Copyright (c) 2015年 Yulong Xiao. All rights reserved.
//

#import "YLWeatherEffectView.h"

@interface YLWeatherEffectView()
@property (nonatomic, weak) CAEmitterLayer *emitterLayer;
@end

@implementation YLWeatherEffectView

-(id)initWithFrame:(CGRect)frame weatherType:(YLWeatherEffectViewType)weatherType NightTime:(BOOL)isNightTime
{
    self = [super initWithFrame:frame];
    if (self) {
        switch (weatherType) {
            case YLWeatherEffectViewTypeCloudy:
                break;
            case YLWeatherEffectViewTypeRainy:
                [self setToRainyInNightTime:isNightTime];
                break;
            case YLWeatherEffectViewTypeSnowy:
                break;
            case YLWeatherEffectViewTypeSunny:
                [self setToSunnyInNightTime:isNightTime];
                break;
            default:
                break;
        }
        
    }
    return self;
}

-(void)setToSunnyInNightTime:(BOOL)isNightTime
{
    ;
}

-(void)setToRainyInNightTime:(BOOL)isNightTime
{
    if (isNightTime) {
        self.backgroundColor = [UIColor blackColor];
    }else{
        self.backgroundColor = [UIColor blueColor];
    }
    _emitterLayer = (CAEmitterLayer *)self.layer;
    _emitterLayer.emitterPosition = CGPointMake(self.bounds.size.width / 2, 10);
    _emitterLayer.emitterSize = CGSizeMake(self.bounds.size.width, 10);
    _emitterLayer.emitterShape =kCAEmitterLayerRectangle;
    _emitterLayer.scale = 0.5;
    CAEmitterCell* cell = [CAEmitterCell emitterCell];
    cell.birthRate = 80;
    cell.lifetime = 2.0;
    cell.lifetimeRange = 1;
    cell.color = [[UIColor colorWithRed:1 green:1 blue:1 alpha:0.5] CGColor];
    cell.contents = (id)[[UIImage imageNamed:@"YLWE_cell_rain.png"] CGImage];
    [cell setName:@"rain"];
    
    _emitterLayer.emitterCells = @[cell];
    
    cell.velocity = 500;
    cell.velocityRange = 150;
    cell.emissionLongitude = M_PI_2;
    cell.emissionRange = M_PI / 100;
    cell.scaleRange = 0.3;
    cell.alphaRange = 0.99;
}

-(id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame weatherType:YLWeatherEffectViewTypeRainy NightTime:YES];
}

+(Class)layerClass
{
    return [CAEmitterLayer class];
}

@end
