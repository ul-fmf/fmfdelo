# Predloga za magisterij

To je primer predloge za magisterij, ki ustreza
[navodilom za pisanje magisterija](https://www.fmf.uni-lj.si/si/knjiznica-matematicna/navodila-bol-mag/).
Prenesite si [template.zip](template.zip), odzipajte, izpolnite in začnite pisati. Lahko prenesete tudi
[angleško verzijo](template_english.zip).

## Uporaba predloge
Pod napisom "Naslednje ukaze ustrezno popravi" izpolni ime avtorja, mentorja, morebitnega somentorja,
naslov dela in leto magistriranja. Ti ukazi se uporabijo v generiranju naslovnice, izjave, povzetka in
PDF metapodatkov. Če želite, lahko odkomentirate kazalo slik. Dopolnite program dela in povzetek ter ključne besede.
Nato nadaljujte z uvodom. Uporabljajte LaTeXovo sklicevanje, ki ga vedno povežite s prejšnjo besedo z nedeljivim
presledkom kot npr. `na sliki~\ref{fig:label} vidimo`. Pazite na predolge presledke po pikah za kraticami, kot so
"npr., t.i., tj." ipd. Tam uporabite `\ ` ali `~`. Za pisanje enačb uporabljajte `\[ \]`, `equation`, `align` ali
`align*` okolja in ne `eqnarray` ipd.

## PDF metapodatki
V elektronski verziji se bodo nastavili PDF metapodatki o avtorju in naslovu (vidite v titlebaru PDF readerja).
Poleg tega se bodo zgenerirali tudi bookmarki za poglajva in podpoglavja v PDF (vidni na levi strani kot drevesna struktura).
Tu so lahko težave z matematičnimi/UTF-8 znaki v nadlovih naloge ali poglavjih, ki jih PDF reader ne prebavi. V tem primeru
se avtomatsko izpustijo, če pa jih želimo zamenjati s plain-text/UTF-8 znaki pa lahko to storigmo z `\texorpdfstring`,
kot prikazano na primeru v predlogi.

## Literatura
V `.bst` datoteki je definiran stil navajanja literature. Vsak vnos iz `literatura.bib`, ki je tudi citiran v dokumentu
s pomočjo `\cite{label}` se pojavi na seznamu. Najpogostejši tipi citatov so `@article` za članke, `@book` za knjige,
`@phdthesis`, `@mastersthesis` in `@bachelorsthesis` za doktorate, magisterije in diplome, `@inproceedings` za konference
in `@misc` za ostalo (ponavadi splene naslove). Literatura se avtomatski vključi v LaTeX kodo, tako da se lahko v njej
uporablja tudi matematiko `$...$` in je potrebno escapati vse posebne znake (npr. `#`, `%`, ...).

Več o urejanju literature je na voljo [tukaj](https://en.wikibooks.org/wiki/LaTeX/Bibliography_Management#BibTeX).
Za urejanje `.bib` datotek priporočam program [JabRef](http://www.jabref.org/), ki zna samodejno okrajšati imena
revij, dobiti DOI člankov in podatke iz ISBN ter lepo oblikuje datoteko. Na voljo je za Windows, Linux in Mac.

## Prevajanje dokumenta
Ker dokument vsebuje zunanjo literaturo in stvarno kazalo, je potrebno pri TeXWorks izbrati za prevajanje opcijo
`pdflatex+bibtex+makeindex`. Za urejanje dokumentov močno priporočam [TeXStudio](http://www.texstudio.org/),
ki zna autocompletati sklice, citate ipd.  Na voljo je za Windows, Linux in Mac. Za prevajanje s stvarnim
kazalom je potrebno `Options > Configure TeXStudio > Show Advanced Options > Build > PDF Chain` nastaviti na
`txs:///pdflatex | txs:///bibtex | txs:///makeindex | txs:///pdflatex | txs:///pdflatex | txs:///view-pdf`.
(vsebovati mora `makeindex`). Literatura se prevede avtomatsko brez dodatnih nastavitev.

Če gre pri prevajanju kaj narobe, med poskušanjem različnih stvari, ki odpravijo težavo, ne pozabite počistiti
dodatnih datotek (`.log`, `.aux` ipd.), da se stare napake ne zadržuejo notri. V TexStudiu je za to navoljo ukaz
`Tools > Clean Auxiliary Files`, na Linuxu pa tudi ukaz `latexmk -c`.

## Preverjanje črkovanja
Uporabljajte urejevalnik, ki preverja črkovanje. V predlogi so napisani ukazi za avtomatsko črkovnje v slovenščini za
TeXStudio in [vim](http://www.vim.org/). Za preverjanje črkovanja neodvisno od uporabljenega urejevalnika lahko uporabite
[aspell](http://aspell.net/).

## PDF/A-1b format
Knjižnica zahteva shranjevanje PDF datotek magisterijev in diplom v PDF/A-1b formatu, primernem za
arhiviranje. Ta format je bolj restriktiven od običajnega in med drugim zahteva obstoj PDF
metapodatkov, vse uporabljene pisave morajo biti vdelane v dokument in slike ne smejo vsebovati
prosojnih elementov. PDF, generiran s to predlogo, naj bi že ustrezal standardu PDF/A-1b, če
niste vključili slik s prosojnostjo. Na začetku dokumenta se zgenerira datoteka z metapodatki
(`magisterij.xmpdata`), ki jo pri izdelavi dokumenta uporabi paket `\usepackage[a-1b]{pdfx}`.
Vaš PDF na koncu vseeno preverite z uporabo kakšnega validatorja, npr.
[https://www.pdf-online.com/osa/validate.aspx](https://www.pdf-online.com/osa/validate.aspx).
Napaki `The value of the key SMask is an image but must be None.` ali `The key S has a value
Transparency which is prohibited.` pomenita, da imate vključeno kakšno prosojno sliko. Za rastrske
slike je ponavadi dovolj, da vso prosojno barvo spremenite v belo, z uporabo primernega programa.
Za slike v vektorskih formatih je potrebno ponavadi nastaviti ozadje, za `.pdf` format lahko na
primer kar uredite datoteko in zamenjate `/Transparency` pri polju `/S` z `/GTS_PDFA1`.
V najslabšem primeru lahko PDF pretvorite v PDF/A-1b format tudi z uporabo kakšnega drugega programa
ali online orodja ali pa to naredite v matematični knjižnici.

## Pogosta vprašanja
Za težave in vprašanja glede template-a, prosim odprite nov issue, pred tem pa preglejte
[že obstoječe](https://github.com/jureslak/magisterij-template/issues?q=is%3Aissue), če morda rešijo vašo težavo.

## Zahvale
Hvala Anji Petković za angleško verzijo, Maji Klavžar za natančna navodila glede navajanja literature in
Matjažu Konvalinki za podporo s strani fakultete.

Jure Slak, 2017
