//
//  MackenzieDicionario.m
//  Navigation
//
//  Created by Lucas Saito on 25/02/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "MackenzieDicionario.h"

@implementation MackenzieDicionario

-(id)init {
    self = [super init];
    
    if (self) {
        dicionario = [[NSMutableArray alloc]init];
        
        //Inicializa o dicionário de letras
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Avião" andImagem:@"aviao.jpg"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Banana" andImagem:@"banana.jpeg"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Carro" andImagem:@"carro.jpeg"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Dado" andImagem:@"dado.jpg"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Elefante" andImagem:@"elefante.jpg"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Faca" andImagem:@"faca.jpeg"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Gato" andImagem:@"gato.jpg"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Helicóptero" andImagem:@"helicoptero.jpeg"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Igreja" andImagem:@"igreja.jpg"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Janela" andImagem:@"janela.jpeg"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Kiwi" andImagem:@"kiwi.png"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Livro" andImagem:@"livro.jpg"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Mamão" andImagem:@"mamao.jpg"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Navio" andImagem:@"navio.png"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Ovo" andImagem:@"ovo.jpg"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Pato" andImagem:@"pato.jpg"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Queijo" andImagem:@"queijo.jpg"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Rato" andImagem:@"rato.jpg"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Sapo" andImagem:@"sapo.jpg"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Tangerina" andImagem:@"tangerina.jpg"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Urubu" andImagem:@"urubu.gif"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Vaca" andImagem:@"vaca.jpg"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Walkman" andImagem:@"walkman.jpg"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Xícara" andImagem:@"xicara.jpg"]];
        [dicionario addObject:[[MackenziePalavra alloc] initWithPalavra:@"Zebra" andImagem:@"zebra.jpg"]];
    }
    
    return self;
}

+(id)allocWithZone:(NSZone *)zone {
    return [self sharedInstance];
}

+(MackenzieDicionario *)sharedInstance {
    static MackenzieDicionario *instancia = nil;
    
    if (!instancia) {
        instancia = [[super allocWithZone:nil]init];
    }
    
    return instancia;
}

-(NSMutableArray *)obterDicionario {
    NSMutableArray *regrasOrdenacao = [[NSMutableArray alloc]init];
    [regrasOrdenacao addObject:[[NSSortDescriptor alloc] initWithKey:@"palavra" ascending:YES]];
    
    NSArray *dicionarioOrdenado = [dicionario sortedArrayUsingDescriptors:regrasOrdenacao];
    
    return [[NSMutableArray alloc]initWithArray:dicionarioOrdenado];
}

@end
