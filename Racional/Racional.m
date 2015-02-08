//
//  Racional.m
//  Racional
//
//  Created by Filippo Aresu on 3/2/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "Racional.h"

@implementation Racional


+(Racional *)devuelveRacional{   //+(instancetype)devuelveRacional{
    return [[Racional alloc]initWithNumerador:1 Denominador:1];;
}


+(Racional *)sumaRacionales:(Racional *)rac1 racional2:(Racional *)rac2{
    NSInteger num = (rac1.numerador * rac2.denominador) + (rac2.numerador * rac1.denominador);
    NSInteger den = (rac1.denominador * rac2.denominador);
    Racional *suma = [[Racional alloc]initWithNumerador:num Denominador:den];
    [suma simplificaValor];
    
    return suma;
}

-(instancetype) init{
    return [self initWithNumerador:1 Denominador:1];
}

-(instancetype)initWithNumerador:(NSInteger)numerador Denominador:(NSInteger)denominador{
    self = [super init];
    if(self){
        _numerador=numerador;
        _denominador=denominador;
    }
    return self;
}

-(void)simplificaValor{
    /*while(self.numerador % 2 == 0 && self.denominador % 2 ==0){
        self.numerador = self.numerador/2;
        self.denominador = self.denominador/2;
    }
    while(self.numerador % 3 == 0 && self.denominador % 3 ==0){
        self.numerador = self.numerador/3;
        self.denominador = self.denominador/3;
    }
    while(self.numerador % 5 == 0 && self.denominador % 5 ==0){
        self.numerador = self.numerador/5;
        self.denominador = self.denominador/5;
    }
    while(self.numerador % 7 == 0 && self.denominador % 7 ==0){
        self.numerador = self.numerador/7;
        self.denominador = self.denominador/7;
    }
    while(self.numerador % 11 == 0 && self.denominador % 11 ==0){
        self.numerador = self.numerador/11;
        self.denominador = self.denominador/11;
    }*/
    
    //se guardan objetos de number en el array
    NSArray *primos = @[@2,@3,@5,@7,@11];
    for(NSNumber *n in primos){
        NSInteger d = [n integerValue];
        while(self.numerador % d == 0 && self.denominador % d ==0){
            self.numerador = self.numerador / d;
            self.denominador = self.denominador /d;
        }
    }
}

-(NSString *)representacionString{
    return [NSString stringWithFormat:@"%li/%li", self.numerador, self.denominador];
}


-(float)resultado{
    return (float)self.numerador/(float)self.denominador;
}


- (id)copyWithZone:(NSZone *)zone{
    return [[Racional alloc]initWithNumerador:self.numerador Denominador:self.denominador];
}


- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeInteger: self.numerador forKey:@"numerador"];
    [encoder encodeInteger:self.denominador forKey:@"denominador"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    if (!self) {
        return nil;
    }
    self.numerador = [aDecoder decodeIntegerForKey:@"numerador"];
    self.denominador = [aDecoder decodeIntegerForKey:@"denominador"];
    
    return self;
}

@end
