//
//  MackenzieDicionarioViewController.m
//  Navigation
//
//  Created by Lucas Saito on 25/02/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "MackenzieDicionarioViewController.h"

@interface MackenzieDicionarioViewController ()

@end

@implementation MackenzieDicionarioViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        indice = 0;
    }
    return self;
}

-(id)initWithPalavra:(MackenziePalavra *)p {
    self = [super init];
    if (self) {
        palavra = p;
        indice = [[[MackenzieDicionario sharedInstance] obterDicionario] indexOfObject:p];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    synthesizer = [[AVSpeechSynthesizer alloc] init];
    
    botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [botao setFrame:CGRectMake(100, 100, 100, 20)];
    [botao addTarget:self action:@selector(falarPalavra:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:botao];
    
    imagemView = [[UIImageView alloc] init];
    [imagemView setFrame:CGRectMake(50, 200, 200, 200)];
    [imagemView setNeedsDisplay];
    [self.view addSubview:imagemView];
    
    [self carregarView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Código de inicialização da View

-(void)carregarViewInitPalavra {
    palavra = [[[MackenzieDicionario sharedInstance] obterDicionario] objectAtIndex:indice];
    
    [self setTitle:[palavra obterLetraIncialDaPalavra]];
    if ((indice+1) < [[[MackenzieDicionario sharedInstance] obterDicionario] count]) {
        UIBarButtonItem *proximo = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(proximaLetra:)];
        [[self navigationItem] setRightBarButtonItem:proximo];
    } else {
        UIBarButtonItem *primeiro = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(primeiraTela:)];
        [[self navigationItem] setRightBarButtonItem:primeiro];
    }
    
    //Mostre uma palavra, uma figura e leia a palavra ao apertar um botao
    
    [botao setTitle:[palavra palavra] forState:UIControlStateNormal];
    
    UIImage *imagem = [UIImage imageNamed:[palavra nomeImagem]];
    [imagemView setImage:imagem];
}

-(void)carregarView {
    UIBarButtonItem *anterior = [[UIBarButtonItem alloc]initWithTitle:@"<" style:UIBarButtonItemStylePlain target:self action:@selector(palavraAnterior:)];
    [[self navigationItem] setLeftBarButtonItem:anterior];
    UIBarButtonItem *proximo = [[UIBarButtonItem alloc]initWithTitle:@">" style:UIBarButtonItemStylePlain target:self action:@selector(palavraPosterior:)];
    [[self navigationItem] setRightBarButtonItem:proximo];
    
    [self atualizarView];
}

-(void)atualizarView {
    palavra = [[[MackenzieDicionario sharedInstance] obterDicionario] objectAtIndex:indice];
    
    [self setTitle:[palavra obterLetraIncialDaPalavra]];
    
    MackenziePalavra *palavraAnterior = [[[MackenzieDicionario sharedInstance] obterDicionario] objectAtIndex:[self indiceAnterior]];
    MackenziePalavra *palavraPosterior = [[[MackenzieDicionario sharedInstance] obterDicionario] objectAtIndex:[self indicePosterior]];
    [[[self navigationItem] leftBarButtonItem] setTitle:[NSString stringWithFormat:@"< %@", [palavraAnterior obterLetraIncialDaPalavra]]];
    [[[self navigationItem] rightBarButtonItem] setTitle:[NSString stringWithFormat:@"%@ >", [palavraPosterior obterLetraIncialDaPalavra]]];
    
    //Mostre uma palavra, uma figura e leia a palavra ao apertar um botao
    
    [botao setTitle:[palavra palavra] forState:UIControlStateNormal];
    
    //Para melhorar a performance da memória (RAM), utilizar a seguinte forma de instânciar uma imagem
    //Fonte: http://xcodenoobies.blogspot.com.br/2011/02/best-way-to-use-uiimageview-memory.html
    NSString *caminhoImagem = [NSString stringWithFormat:@"/%@", [palavra nomeImagem]];
    NSString *fullpath = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:caminhoImagem];
    UIImage *imagem = [UIImage imageWithContentsOfFile:fullpath];
    [imagemView setImage:imagem];
}

#pragma mark - Métodos do selector (instânciando uma nova View)

-(void)proximaLetra:(id)sender {
    MackenziePalavra *proximaPalavra = [[[MackenzieDicionario sharedInstance] obterDicionario] objectAtIndex:indice+1];
    MackenzieDicionarioViewController *proximaViewController = [[MackenzieDicionarioViewController alloc] initWithPalavra:proximaPalavra];
    [[self navigationController] pushViewController:proximaViewController animated:YES];
}

-(void)primeiraTela:(id)sender {
    [[self navigationController] popToRootViewControllerAnimated:YES];
}

#pragma mark - Métodos do selector (utilizando a mesma View)

-(void)palavraAnterior:(id)sender {
    indice = [self indiceAnterior];
    
    [self atualizarView];
}

-(void)palavraPosterior:(id)sender {
    indice = [self indicePosterior];
    
    [self atualizarView];
}

-(void)falarPalavra:(id)sender {
    //Fonte: http://www.devfright.com/quick-look-avspeechsynthesizer-class/
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:[palavra palavra]];
    [utterance setRate:AVSpeechUtteranceMinimumSpeechRate];
    [utterance setVoice: [AVSpeechSynthesisVoice voiceWithLanguage:@"pt-br"]];
    [synthesizer speakUtterance:utterance];
}

#pragma mark - Métodos genéricos da classe

-(NSInteger)indiceAnterior {
    if (indice == 0) { //se for o primeiro item
         return [[[MackenzieDicionario sharedInstance] obterDicionario] count] - 1; //vai para o último
    } else {
        return indice - 1;
    }
}

-(NSInteger)indicePosterior {
    if (indice == [[[MackenzieDicionario sharedInstance] obterDicionario] count] - 1) { //se for o último item
        return 0; //volta para o primeiro
    } else {
        return indice + 1;
    }
}

@end
