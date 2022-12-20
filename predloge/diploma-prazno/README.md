# Predloga za delo diplomskega seminarja

Za pisanje dela diplomskega seminarja, prenesite [primer](../../arhivi/diploma-primer.zip) ali [prazno predlogo](../../arhivi/diploma-prazna.zip), preimenujte datoteko
`Priimek-Vpisna-Leto.tex` in jo odprite.

## Uporaba predloge
Pod napisom "naslednje ukaze ustrezno napolnite" izpolni ime avtorja, mentorja, morebitnega
somentorja, naslov dela in ostalo. Ti ukazi se uporabijo kasneje v generiranju prvih strani
dokumenta.  Več navodil o tem, kako pisati, je na spletni učilnici. Za bolj napredne vsebine
si lahko ogledate predlogo za magistrska dela.

## Prevajanje dokumenta
Dokument bi se moral prevesti brez posebnosti, če imate `.cls` in `.tex` datoteki v isti mapi.  Če
dobite pri prevajanju napako podobno `! Package keyval Error: pdfapart undefined.`, priporočamo, da
posodobite svojo distribucijo LaTeXa na najnovejšo verzijo.

Če dobite napako oblike
```
(./fmfdelo.cls
! Undefined control sequence.
\UseTextAccent ...up \@firstofone \let \@curr@enc
                                                  \cf@encoding \@use@text@en...
l.2 ...fmfdelo}[2016/10/13 Zaključna dela na FMF]
```
morate posodobiti `.cls` datoteko na najnovejšo verzijo. V `fmfdelo.cls` v vrstici `2`
dela težave `č`, ki ga je potrebno zamenjati s `c`.

## Citiranje literature
Sledite navodilom in primerom citiranja literature v dokumentu. Na voljo imate tudi možnost
avtomatskega navajanja literature s sistemom [BibTeX](http://www.bibtex.org/), ki avtomatsko
pravilno uredi in oblikuje vnoste literature. Navodila za uporabo so opisana pri [predlogi za
magisterije](../magistrsko_delo/).

## Pisanje algoritmov
Za pisanje algoritmov je v paketu že vključen paket
[algoritmix](http://tug.ctan.org/macros/latex/contrib/algorithmicx/algorithmicx.pdf) in primer
algoritma. Sintakso paketa najlažje razberete kar iz primera, opisana pa je tudi v navodilih paketa.
Podobno kot pri slikah, mora biti na vsak algoritem podan sklic v besedilu, opisani pa morajo biti
tudi vsi vhodni in izhodni parametri.

## Vključevanje psevdokode
Za vključevanje izvorne kode priporočamo paket [minted](https://github.com/gpoore/minted),
ki zna s pomočjo Python knjižnice [pygments](http://pygments.org/) obarvati več kot 300 jezikov.
Za njegovo uporabo morate imati naloženo omenjeno knjižnico (preverite tako, da v konzolo napišete
`pygmentize --help` in vidite, ali deluje). Poleg tega je treba LaTeX-u dovoliti izvajanje zunanjih
programov s pomočjo opcije `-shell-escape`.
