# Template LaTeX para Relatório Técnico UNIVESP

Com esse template, deve-se conseguir produzir relatórios dentro das normas
da UNIVESP e da ABNT também, já que se usa a classe de documento **abntex2**
para formatar os pequenos detalhes (que não merecem a atenção de ninguém !!!)
automaticamente.

## Instruções Gerais de Uso

O LaTeX precisa já ter sido instalado com uma quantidade enorme de dependências.
Não se assuste, cada uma delas vale muito a pena. Entre elas já deve se
encontrar o pacote **abntex2**.

O cerne das funcionalidades específicas quanto à UNIVESP estão no arquivo
**univesp_prembulo.sty**. Ele define questões específicas da formatação da capa
dos relatórios técnicos e já ajusta os diversos dados para que se repitam
nos lugares apropriados. Provavelmente você não deve mexer nesse arquivo.

O arquivo **relatorio.tex** é o ponto de entrada para a produção do *pdf*.
Nele se encontra vários cabeçalhos LaTeX comumente utilizados na produção
de relatórios e as dependências extras para o formato da UNIVESP.

Como o link do youtube não é algo presente em todos os relatórios, esse dado
pode ser omitido e **univesp_prembulo.sty** cuida para que a caixa contendo o
link não seja desenhada no *pdf*.

De resto, preencha os dados dos comandos para a geração e formatação automática
do elementos pré-textuais. Deve ter notado que cada parte do relatório se
encontra num arquivo separado de nome idêntico. Eles são reunidos
num arquivo principal atráves de diretivas **\input{}**, que também cuida
de delinear a estrutura do relatório com chamadas a:
- **\section**, **\subsection**, **\subsubsection**, etc. para nomear cada
tópico
- tabela de conteúdos: **\tableofcontents**
- lista de figuras: **\listoffigures**

Há também um arquivo **bibliografia.bib**, que pode ser usado para preencher
dados bibliográficos e deixar que o compilador cuide da formatação
(no nosso caso, através do **abntex2**). Alguns editores desse tipo de arquivo, como [TeXstudio](https://www.texstudio.org)
normalmente apresentam os vários formatos de bibliografias e os campos
obrigatórios e opcionais dentro de cada um.

## Dicas de Comandos

Para instalar no Ubuntu e derivados as dependências desse projeto:

```sh
sudo apt install texlive texlive-publishers texlive-lang-portuguese texlive-bibtex-extra biber
```

Caso tenha interesse de usar LaTeX pelo terminal, para compilar existe um *makefile* sendo distribuído com esse projeto e invocado convencionalmente com `make`.
Use `make clean` para apagar a enxurrada de arquivos auxiliares.

Para ser mais prático, você pode botar no seu arquivo de configuração do terminal Linux (como o `.bashrc`) a seguinte função para ser usada em qualquer projeto envolvendo LaTeX:

```sh
function compile-latex () {
	[ ! -f "$1" ] && echo Arquivo não encontrado! && return 1
	latex --output-format=pdf $1
	biber ${1%.tex}.bcf
	latex --output-format=pdf $1
	latex --output-format=pdf $1
}
```

Invocada assim:

```sh
compile-latex relatorio.tex
```

## Informações Adicionais

Que bom que mais alguém quer aprender LaTeX! Se precisar de alguma coisa ou
relatar um bug, vá nos *issues* da página do projeto no Github: você já deve
estar lendo isto neste site, é só uma questão de clicar numa aba ao lado.

Felicitações!
