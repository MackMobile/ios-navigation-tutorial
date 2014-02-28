//
//  MackenziePalavra.h
//  Navigation
//
//  Created by Lucas Saito on 25/02/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MackenziePalavra : NSObject {
    NSString *palavra;
    NSString *nomeImagem;
}

@property NSString *palavra, *nomeImagem;

-(id)initWithPalavra:(NSString *)p andImagem:(NSString *)img;
-(NSString *)obterLetraIncialDaPalavra;

@end
