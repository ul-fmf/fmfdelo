# Predloga za magisterij

Za pisanje dela diplomskega seminarja, prenesite [template.zip](template.zip), preimenujte datoteko
`PredlogaDela.tex` in jo odprite.

## Uporaba predloge
Pod napisom "naslednje ukaze ustrezno napolnite" izpolni ime avtorja, mentorja, morebitnega
somentorja, naslov dela in ostalo. Ti ukazi se uporabijo kasneje v generiranju prvih strani
dokumenta.  Več navodil o tem, kako pisati, je na spletni učilnici. Za bolj napredne vsebine
si lahko ogledate predlogo za magistrska dela.

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
