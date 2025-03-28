---
title: fmfdelo
---

# Predloge za zaključna dela na oddelku za matematiko [FMF UL](https://www.fmf.uni-lj.si/)

Za uporabo najprej **preberite navodila na vaši spletni učilnici**, nato pa prenesite ustrezen arhiv s predlogo:

- [diploma-prazno.zip](arhivi/diploma-prazno.zip): prazna predloga za delo diplomskega seminarja
- [diploma-primer.zip](arhivi/diploma-primer.zip): primer dela diplomskega seminarja
- [diploma-primer-razclenjen.zip](arhivi/diploma-primer-razclenjen.zip): primer dela diplomskega seminarja z razdelki v posameznih datotekah
- [diploma-primer-trst.zip](arhivi/diploma-primer-trst.zip): primer dela programa dvojne diplome na Trstu
- [magisterij-primer-sl.zip](arhivi/magisterij-primer-sl.zip): primer magistrskega dela
- [magisterij-primer-razclenjen-sl.zip](arhivi/magisterij-primer-razclenjen-sl.zip): primer magistrskega dela z razdelki v posameznih datotekah
- [magisterij-primer-en.zip](arhivi/magisterij-primer-en.zip): primer magistrskega dela v angleščini
- [magisterij-primer-trst.zip](arhivi/magisterij-primer-trst.zip): primer dela programa dvojnega magisterija na Trstu

in sledite spodnjim [navodilom za uporabo](#navodila-za-uporabo). Dokument bi se moral prevesti brez posebnosti in dodatnih nastavitev. Nekaj pogostih težav in rešitev je [opisanih spodaj](#odpravljanje-napak). Če na zgornjem seznamu ni ustreznega arhiva za vaš program, nas prosimo kontaktirajte.

Za pomoč pri razvoju se zahvaljujemo Aniti Buckley (za pomoč pri poenotenju in uvedbi PDF/A), Maji Klavžar (za vsa natančna navodila in nasvete glede oblikovanja), Matjažu Konvalinki (kot skrbniku za vse potrebne informacije), Anji Petković (za angleški primer magistrskega dela) in Sašu Strletu (za prvo različico predloge za diplomsko delo).

_Razvijalci_: [Luna Strah](mailto:strah.luna@gmail.com), Jure Slak, Matija Pretnar, Gašper Golob in Katja Berčič.

## Navodila za uporabo

Za urejanje dokumentov močno priporočamo [Visual Studio Code](https://code.visualstudio.com) s podaljškom [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) in podaljškom za črkovanje [LTeX](https://marketplace.visualstudio.com/items?itemName=valentjn.vscode-ltex). Za preverjanje črkovanja neodvisno od urejevalnika lahko uporabite [aspell](http://aspell.net/).

V LaTeX dokumentu pod komentarjem `% naslednje ukaze ustrezno dopolnite` izpolnite ime avtorja, mentorja, morebitnega somentorja, naslov dela in ostalo. Ti ukazi se uporabijo v generiranju naslovnice, izjave, povzetka in PDF metapodatkov.

Predloga podpira arhivski standard [PDF/A-2b](https://en.wikipedia.org/wiki/PDF/A), ki mu mora zadoščati vaše zaključno delo, ko ga boste oddali preko VIS-a. Med prevajanjem se samodejno pripravijo ustrezni metapodatki in zaznamki za poglavja, ki jih lahko vidite v drevesni strukturi v pregledovalniku PDF dokumentov.

Pred oddajo (ali pa že kdaj prej) z uporabo spletnega validatorja [PDFForge](https://www.pdfforge.org/pdfcreator-online/en/validate-pdfa) ali pa z validatorjem [veraPDF](https://openpreservation.org/tools/verapdf/), ki ga lahko namestite na svoj računalnik, preverite, če vaš PDF ustreza standardu PDF/A. Prav tako v pregledovalniku preverite, ali PDF vsebuje prave metapodatke: _File_ > _Properties_ > _Document properties_.

### Pisanje zaključnega dela v Microsoft Wordu

Vse predloge so namenjene za pisanje dela v LaTeX-u. Če slučajno želite uporabljati Microsoft Word, morate za pravilno oblikovanje poskrbeti sami. Za pretvorbo v standard PDF/A morate najprej v dokument vpisati potrebne metapodatke. Pojdite na _File_ > _Info_ > _Show all properties_ in vpišite ustrezne podatke v polja _Author_, _Title_, _Company_ (vpišite »Univerza v Ljubljani, Fakulteta za matematiko in fiziko«) in _Tags_ (vpišite ključne besede). Nato dokument shranite kot PDF/A tako, da izberete _File_ > _Save as_ > _Save as type: PDF_ > _Options_ (spodaj) > _PDF options_ > _PDF/A compliant_. Slednja možnost deluje le na Wordu za Windowse, ki pa je na voljo na študentskih računalnikih.

## Odpravljanje napak

Če imate težavo s predlogo:

1. Najprej **počistite dodatne datoteke** (`.log`, `.aux` ipd.), v katerih se lahko stare napake zadržujejo dlje, kot je treba. V urejevalniku Visual Studio Code to naredite tako, da v paleti ukazov (Command Palette, <kbd>Ctrl+Shift+P</kbd> oz. <kbd>Cmd+Shift+P</kbd> na macOS) natipkate `Clean Auxiliary Files`. Tam bo pisalo tudi, s katero bližnjico pridete do te funkcije na vašem računalniku. Alternativno lahko v ukazni vrstici poženete ukaz `latexmk -c`.
2. V [spodnjem seznamu](#seznam-najpogostejših-napak) poiščite napako, ki jo imate, sledite navodilom ter **ponovite 1. korak**.
3. Če napake na seznamu ne najdete, stopite v stik z razvijalci ali odprite [issue na GitHubu](https://github.com/ul-fmf/fmfdelo/issues/new). **V nobenem primeru ne spreminjajte datoteke `fmfdelo.cls` ali strukture predloge**, saj je šlo zaradi standarda PDF/A v predlogo veliko truda in bo spreminjanje bolj kot ne še kaj dodatno pokvarilo.

### Seznam najpogostejših napak

#### Matematični simboli v naslovih in ključnih besedah

Če v naslovih ali ključnih besedah uporabite matematične znake, jih pregledovalnik mogoče ne bo prikazal, ali pa bo celo prišlo do težav pri prevajanju. V tem primeru lahko z ukazom `\texorpdfstring{$formula$}{golo besedilo}` (kot je prikazano na primeru v predlogi), dodate še se golo besedilo (ki lahko vsebuje UTF-8 znake), ki se bo uporabilo v PDF kazalu ali meta-podatkih PDF dokumenta.

#### `pdfapart undefined`

Če dobite pri prevajanju napako podobno `! Package keyval Error: pdfapart undefined.`, priporočamo, da posodobite svojo distribucijo LaTeX-a na najnovejšo verzijo. Prvi nasvet je torej, da posodobite svojo distribucijo LaTeX-a na najnovejšo verzijo, v kateri omogočite sprotno nalaganje paketov. Ustrezni distribuciji sta MikTeX in TeX Live.

#### `./fmfdelo.cls  ! Undefined control sequence.`

Če dobite napako oblike

    (./fmfdelo.cls
    ! Undefined control sequence.
    \UseTextAccent ...up \@firstofone \let \@curr@enc
                                                    \cf@encoding \@use@text@en...
    l.2 ...fmfdelo}[2016/10/13 Zaključna dela na FMF]

morate posodobiti `.cls` datoteko na najnovejšo verzijo.

#### `The value of the key SMask ...` / `The key S has a value ...`

Napaki `The value of the key SMask is an image but must be None.` ali `The key S has a value Transparency which is prohibited.` pomenita, da imate vključeno kakšno prosojno sliko. Za rastrske slike je ponavadi dovolj, da s primernim programom prosojno barvo spremenite v belo, za slike v vektorskih formatih pa je potrebno ponavadi nastaviti ozadje. Pri paketu TikZ pa je npr. namesto `\draw[fill=yellow]` treba napisati `\filldraw[color=yellow]`.

#### Manjkajoče velike začetnice v literaturi

BibTeX pri navajanju literature odvisno od stila spreminja velikost črk, na primer

    title = {Predloge za zaključna dela na FMF UL}

se bo lahko odvisno od vrste vira izpisalo kot _Predloge za zaključna dela na Fmf Ul_ ali _Predloge za zaključna dela na fmf ul_. Če želite vsiliti svojo velikost, morate besedilo zaščiti z `{}`, na primer

    title = {Predloge za zaključna dela na {FMF UL}}

#### Neveljaven znak na začetku datoteke

Če vam LaTeX (ali kakšno drugo orodje) javlja napako pred prvim znakom datoteke, tudi če ga pobrišete, gre najverjetneje za [BOM](https://en.wikipedia.org/wiki/Byte_order_mark), poseben neviden znak na začetku datoteke. Znebite se ga tako, da v Visual Studio Code spodaj kliknete na `UTF-8 with BOM` ter izberete `Save with encoding > UTF-8`.

#### Zavrnitev oddanega dela v VIS-u

Če delo ne bo zadoščalo standardu PDF/A, vam bo VIS zavrnil oddajo. Če vam kljub vsem zgornjim navodilom ne uspe pripraviti ustrezne datoteke, lahko v skrajnem primeru uporabite program Adobe Acrobat Pro (program je nameščen na računalniku v Matematični knjižnici). Najprej v dokument vnesete metapodatke z izbiro _File_ > _Properties_ > _Document properties_, nato pa izberete _Tools_ > _Print Production_ > _Preflight_ > _Convert to PDF/A-1b_. Naj še enkrat poudarimo, da je to izhod v sili, če se mudi z oddajo in nobena od rešitev ne pomaga.

#### Ostale napake

Še enkrat, če napake na seznamu ne najdete, **ne spreminjajte datoteke ali strukture predloge**, temveč opozorite razvijalce, da jo lahko preprečimo tudi za ostale uporabnike.
