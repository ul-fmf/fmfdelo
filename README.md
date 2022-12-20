# Splošno o predlogah za zaključna dela na FMF

Na tem repozitoriju boste našli predloge za dela diplomskega seminarja in magistrska dela na OM FMF.
Pred uporabo predloge, **prosim preberite navodila na vaši spletni učilnici in spodnja tehnična
navodila**. Nato preberite ustrezna navodila za uporabo predloge ([magisterij](predloge/magisterij-primer-sl/README.md) ali [diploma](predloge/diploma-prazno/README.md)), prenesite in začnite pisati.

## Prevajanje dokumenta
Če dokument dokument vsebuje zunanjo literaturo (v `.bib` datoteki) ali stvarno kazalo (bolj za
magisterije) je potrebno pri [TeXWorks](https://www.tug.org/texworks/) izbrati za prevajanje opcijo
`pdflatex+bibtex+makeindex`. Za urejanje dokumentov močno priporočam
[TeXStudio](http://www.texstudio.org/), ki zna autocompletati sklice, citate ipd.  Na voljo je za
Windows, Linux in Mac. Za prevajanje s stvarnim kazalom je potrebno `Options > Configure TeXStudio >
Show Advanced Options > Build > PDF Chain` nastaviti na `txs:///pdflatex | txs:///bibtex |
txs:///makeindex | txs:///pdflatex | txs:///pdflatex | txs:///view-pdf`.  (vsebovati mora
`makeindex`). Literatura se prevede avtomatsko brez dodatnih nastavitev.

Pri ukazih `\ref` in `\cite`, bi moral TeXStudio tudi sam ponuditi obstoječe oznake, ki ste jih naredili.
Če pri ukazu `\cite` ne ponudi možnih bibliografskih ključev, je morda kriv makro `\literatura`. Tega lahko
na vrstici `\bibliography{\literatura}` pri koncu dokumenta zamenjate z imenom vaše `.bib` datoteke (brez
končnice), kar pomaga TeXStudiu pri autocompletionu. 

Če gre pri prevajanju kaj narobe, med poskušanjem različnih stvari, ki odpravijo težavo, **ne pozabite
počistiti dodatnih datotek** (`.log`, `.aux` ipd.), da se stare napake ne zadržuejo notri. V TexStudiu
je za to navoljo ukaz `Tools > Clean Auxiliary Files`, na Linuxu pa tudi ukaz `latexmk -c`.

## Preverjanje črkovanja
Uporabljajte urejevalnik, ki preverja črkovanje, npr. TeXStudio ali [vim](http://www.vim.org/). Za
preverjanje črkovanja neodvisno od uporabljenega urejevalnika lahko uporabite
[aspell](http://aspell.net/).

## PDF/A-1b format
Knjižnica zahteva shranjevanje PDF datotek magisterijev in diplom v [PDF/A-1b
formatu](https://en.wikipedia.org/wiki/PDF/A), primernem za
arhiviranje. V tem formatu boste morali tudi oddati svoje zaključno delo.
Ta PDF format je bolj restriktiven od običajnega in med drugim zahteva obstoj PDF
metapodatkov, vse uporabljene pisave morajo biti vdelane v dokument in slike ne smejo vsebovati
prosojnih elementov. PDF, generiran s to predlogo, naj bi že ustrezal standardu PDF/A-1b,
saj za to poskrbi že vključen paket `\usepackage[a-1b]{pdfx}`, če le niste vlkjučili slik s prosojnostjo.

Vaš PDF pred oddajo (ali pa že kdaj prej) vseeno preverite z uporabo [kakšnega
validatorja](https://www.pdf-online.com/osa/validate.aspx).  Napaki `The value of the key SMask is
an image but must be None.` ali `The key S has a value Transparency which is prohibited.` pomenita,
da imate vključeno kakšno prosojno sliko. Za rastrske slike je ponavadi dovolj, da vso prosojno
barvo spremenite v belo, z uporabo primernega programa.  Za slike v vektorskih formatih je potrebno
ponavadi nastaviti ozadje, za `.pdf` format lahko na primer kar uredite datoteko in zamenjate
`/Transparency` pri polju `/S` z `/GTS_PDFA1`.  V najslabšem primeru lahko PDF pretvorite v PDF/A-1b
format tudi z uporabo kakšnega drugega programa ali online orodja ali pa to naredite v matematični
knjižnici.

Če dobite napako `The required XMP property 'pdf:Keywords' for the document information entry 'Keywords' is missing.`
je trenuten wordaround, da se zakomentira vrstica `\Keywords{\kljucnebesede}`, pobrise `.xmpdata` datoteko in ponovno prevede dokument.

## Pogosta vprašanja
Za težave in vprašanja glede template-a, prosim odprite nov issue, pred tem pa preglejte [že
obstoječe](https://github.com/ul-fmf/fmfdelo/issues?q=is%3Aissue), če morda rešijo
vašo težavo.

## Zahvale
Hvala Anji Petković za angleško verzijo magisterija, Maji Klavžar za natančna navodila glede
navajanja literature, Sašu Strletu in Matjažu Konvalinki kot skrbnikoma programov za vse potrebne
informacije in Aniti Buckley za pomoč pri poenotenju in uvedbi PDF/A formata.

Matija Pretnar & Jure Slak (jure.slak@fmf.uni-lj.si)
