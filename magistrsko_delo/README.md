# Predloga za magisterij

To je primer predloge za magisterij, ki ustreza
[navodilom za pisanje magisterija](https://www.fmf.uni-lj.si/si/knjiznica-matematicna/navodila-bol-mag/).
Prenesite si [template.zip](template.zip), odzipajte, izpolnite in začnite pisati. Lahko prenesete tudi
[angleško verzijo](template_english.zip).

## Uporaba predloge
Pod napisom "Naslednje ukaze ustrezno popravi" izpolni ime avtorja, mentorja, morebitnega
somentorja, naslov dela in ostalo. Ti ukazi se uporabijo v generiranju naslovnice,
izjave, povzetka in PDF metapodatkov. Če želite, lahko odkomentirate kazalo slik. Dopolnite program
dela in povzetek ter ključne besede.  Nato nadaljujte z uvodom. Uporabljajte LaTeXovo sklicevanje,
ki ga vedno povežite s prejšnjo besedo z nedeljivim presledkom kot npr. `na sliki~\ref{fig:label}
vidimo`. Pazite na predolge presledke po pikah za kraticami, kot so "npr., t.i., tj." ipd. Tam
uporabite `\ ` ali `~`. Za pisanje enačb uporabljajte `\[ \]`, `equation`, `align` ali `align*`
okolja in ne `eqnarray` ipd.

## PDF metapodatki
Med prevajanjem se bodo avtomarsko nastavili PDF metapodatki o avtorju in naslovu (vidite v
titlebaru PDF readerja).  Poleg tega se bodo zgenerirali tudi zaznamki za poglajva in podpoglavja v
PDF (vidni na levi strani kot drevesna struktura).  Tu so lahko težave z matematičnimi/UTF-8 znaki v
nadlovih naloge ali poglavjih, ki jih PDF reader ne prebavi. V tem primeru se avtomatsko izpustijo,
če pa jih želimo zamenjati s plain-text/UTF-8 znaki pa lahko to storigmo z `\texorpdfstring`, kot
prikazano na primeru v predlogi.
