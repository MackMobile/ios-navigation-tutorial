//
//  MackenziePalavra.m
//  Navigation
//
//  Created by Lucas Saito on 25/02/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "MackenziePalavra.h"

@implementation MackenziePalavra

@synthesize palavra, nomeImagem;

-(id)initWithPalavra:(NSString *)p andImagem:(NSString *)img {
    self = [super init];
    if (self) {
        palavra = p;
        nomeImagem = img;
    }
    return self;
}

-(NSString *)obterLetraIncialDaPalavra {
    NSString *letraInicial = [NSString stringWithFormat:@"%c", [palavra characterAtIndex:0]];
    
    letraInicial = [letraInicial uppercaseString];
    
    return letraInicial;
}

@end
