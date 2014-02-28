//
//  MackenzieDicionarioViewController.h
//  Navigation
//
//  Created by Lucas Saito on 25/02/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "MackenzieDicionario.h"
#import "MackenziePalavra.h"

@interface MackenzieDicionarioViewController : UIViewController {
    NSInteger indice;
    MackenziePalavra *palavra;
    UIButton *botao;
    UIImageView *imagemView;
    AVSpeechSynthesizer *synthesizer;
}

-(id)initWithPalavra:(MackenziePalavra *)p;

@end
