# Álgebra linear: ferramentas interativas

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.23082803.svg)](https://doi.org/10.5281/zenodo.23082803)

Aplicativo web educacional desenvolvido em R e Shiny para explorar operações elementares com matrizes e transformações lineares no plano.

**Versão atual:** 1.1.1

**Versão em execução:** <https://osnar.shinyapps.io/algebra_linear/>

**Código-fonte:** <https://github.com/Osnar/transformacoes-lineares-no-plano>

## Funcionalidades

O aplicativo possui dois módulos:

- **Escalonamento:** permite criar matrizes e aplicar operações elementares às suas linhas;
- **Transformações lineares no plano:** permite informar os coeficientes da matriz de uma transformação linear e comparar uma figura binária com sua imagem transformada.

A figura binária 35 × 35 utilizada no segundo módulo foi retirada do artigo associado ao aplicativo.

## Artigo associado

> de Abreu, M. O. R., & de Medeiros, A. E. (2026). Transformações lineares, matrizes e imagens digitais: conexões entre Álgebra Linear e computação gráfica. *JEEPEMA, 10*(1), Artigo 1. <https://doi.org/10.4025/jeepema.v10.n1.art1>

Página do artigo: <https://jeepema.com.br/index.php/jeepema/pt_BR/article/view/66>

## Requisitos

O aplicativo foi desenvolvido e testado com R 4.4.1. As versões das dependências usadas na publicação estão registradas em `renv.lock`.

## Execução local

Clone ou baixe este repositório e abra o R no diretório que contém `ui.R` e `server.R`.

Para restaurar as dependências registradas:

```r
install.packages("renv")
renv::restore()
```

Execute o aplicativo:

```r
shiny::runApp(".", launch.browser = TRUE)
```

## Citação

Ao utilizar o software em trabalhos acadêmicos, cite a versão consultada:

**Versão 1.1.1 (atual)**

> de Abreu, M. O. R., & de Medeiros, A. E. (2026). *Álgebra linear: ferramentas interativas* (Versão 1.1.1) [Software de computador]. Zenodo.

O DOI específico será acrescentado após a emissão da versão 1.1.1 pelo Zenodo.

Esta versão corrige a pontuação junto a links, sincroniza os seletores de linhas com a dimensão da matriz e mantém o estilo visual dos botões após atualizações reativas.

**Versão 1.1**

> de Abreu, M. O. R., & de Medeiros, A. E. (2026). *Álgebra linear: ferramentas interativas* (Versão 1.1) [Software de computador]. Zenodo. <https://doi.org/10.5281/zenodo.23091461>

- **DOI da versão 1.1:** <https://doi.org/10.5281/zenodo.23091461>

**Versão 1.0**

> de Abreu, M. O. R., & de Medeiros, A. E. (2026). *Transformações lineares no plano* (Versão 1.0) [Software de computador]. Zenodo. <https://doi.org/10.5281/zenodo.23082804>

- **DOI da versão 1.0:** <https://doi.org/10.5281/zenodo.23082804>
- **DOI conceitual (todas as versões):** <https://doi.org/10.5281/zenodo.23082803>

A versão 1.1 inaugurou o título *Álgebra linear: ferramentas interativas*, que passou a designar o aplicativo completo. Os módulos continuam denominados *Escalonamento* e *Transformações lineares no plano*. A versão 1.0 permanece arquivada sob o título original.

Os metadados de citação também estão disponíveis em [`CITATION.cff`](CITATION.cff).

## Licenças

O código-fonte é distribuído sob a **GNU General Public License, versão 3 ou posterior — GPL-3.0-or-later**. Consulte [`LICENSE`](LICENSE).

A figura binária do gato, sua representação por coordenadas e os demais conteúdos gráficos provenientes do artigo são disponibilizados separadamente sob a **Creative Commons Atribuição 4.0 Internacional — CC BY 4.0**.

- A GPL-3.0-or-later rege o código do aplicativo.
- A CC BY 4.0 rege a figura e o conteúdo gráfico identificado.
- As dependências de terceiros permanecem submetidas às respectivas licenças.

Consulte [`NOTICE.md`](NOTICE.md) para os detalhes de atribuição.
