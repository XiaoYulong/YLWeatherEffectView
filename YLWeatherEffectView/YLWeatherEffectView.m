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
    if (isNightTime) {
        self.backgroundColor = [UIColor blackColor];
    }else{
        self.backgroundColor = [UIColor blueColor];
    }
    _emitterLayer = (CAEmitterLayer *)self.layer;
    _emitterLayer.renderMode = kCAEmitterLayerAdditive;
    
    _emitterLayer.emitterPosition = CGPointMake(100, 100);
//    _emitterLayer.emitterSize = CGSizeMake(20, 20);
    _emitterLayer.emitterShape =kCAEmitterLayerPoint;
    _emitterLayer.scale = 0.2;
    CAEmitterCell* fire = [CAEmitterCell emitterCell];
    fire.birthRate = 200;
    fire.lifetime = 3.0;
//    fire.lifetimeRange = 0.5;
    fire.color = [[UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1] CGColor];
    fire.contents = (id)[[UIImage imageNamed:@"YLWE_cell_sun.png"] CGImage];
    [fire setName:@"fire"];
    
    fire.velocity = 10;
    fire.velocityRange = 0;
    fire.emissionRange = M_PI;
    
    fire.scaleSpeed = 0.3;
    fire.spin = 0.5;
    
    _emitterLayer.emitterCells = @[fire];
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
