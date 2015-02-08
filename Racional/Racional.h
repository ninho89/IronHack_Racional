//
//  Racional.h
//  Racional
//
//  Created by Filippo Aresu on 3/2/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Racional : NSObject <NSCopying, NSCoding>

@property (assign, nonatomic) NSInteger numerador;
@property (assign, nonatomic) NSInteger denominador;

//es lo mismo q escribir +(instancetype)devuelveRacional;
+(Racional *)devuelveRacional;
+(Racional *)sumaRacionales:(Racional *)rac1 racional2:(Racional *)rac2;

-(instancetype)initWithNumerador:(NSInteger)numerador Denominador:(NSInteger)denominador;
-(void)simplificaValor;
-(NSString *)representacionString;
-(float)resultado;



@end
