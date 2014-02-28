//
//  MackenzieDicionario.h
//  Navigation
//
//  Created by Lucas Saito on 25/02/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MackenziePalavra.h"

@interface MackenzieDicionario : NSObject {
    NSMutableArray *dicionario;
}

+(MackenzieDicionario *)sharedInstance;
-(NSMutableArray *)obterDicionario;

@end
