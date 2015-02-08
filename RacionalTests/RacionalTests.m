//
//  RacionalTests.m
//  RacionalTests
//
//  Created by Filippo Aresu on 3/2/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Racional.h"

@interface RacionalTests : XCTestCase

@end

@implementation RacionalTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testRacionalDosValores{
    Racional *sut = [[Racional alloc]initWithNumerador:3 Denominador:6];
    XCTAssertNotNil(sut, @"Racional should not be a nil");
}

-(void)testRacionalNumero1{
    Racional *sut = [[Racional alloc]init];
    XCTAssertTrue(sut.numerador==1, @"Numerador should be 1 ");
    XCTAssertTrue(sut.denominador==1 , @"Denominador should be 1 ");
}

-(void)testRacionalSimplificaValor{
    Racional *sut = [[Racional alloc]initWithNumerador:12 Denominador:24];
    [sut simplificaValor];
    XCTAssertEqual(sut.numerador, 1, @"Numerador Simplificar Valor should return the correct value");
    XCTAssertEqual(sut.denominador, 2, @"Denominador Simplificar Valor should return the correct value");
}

-(void)testRacionalToString{
    Racional *sut = [[Racional alloc]initWithNumerador:3 Denominador:6];
    
    XCTAssertEqualObjects([sut representacionString], @"3/6", @"RepresentacionString should return the correct string");

}

-(void)testRacionalResultadoWorksCorrect{
    Racional *sut = [[Racional alloc]initWithNumerador:1 Denominador:2];
    XCTAssertEqual([sut resultado], 0.5f, @"Resultado should return the correct value");
}

-(void)testRacionalSumaDosNumeros{
    Racional *sut = [[Racional alloc]initWithNumerador:18 Denominador:14];
    Racional *su2 = [[Racional alloc]initWithNumerador:1 Denominador:7];
    Racional *res = [Racional sumaRacionales:sut racional2:su2];
    XCTAssertEqual(res.numerador, 10, @"Numerdor Suma should return the correct value");
    XCTAssertEqual(res.denominador, 7, @"Numerdor Suma should return the correct value");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
