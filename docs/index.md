---
title: fmfdelo
---

# Predloge za zaključna dela na oddelku za matematiko [FMF UL](https://www.fmf.uni-lj.si/)

Za uporabo najprej **preberite navodila na vaši spletni učilnici**, nato pa prenesite ustrezen arhiv s predlogo:

- [diploma-prazno.zip](arhivi/diploma-prazno.zip): prazna predloga za delo diplomskega seminarja
- [diploma-primer.zip](arhivi/diploma-primer.zip): primer dela diplomskega seminarja
- [diploma-primer-razclenjen.zip](arhivi/diploma-primer-razclenjen.zip): primer dela diplomskega seminarja s poglavji v posameznih datotekah
- [magisterij-primer-sl.zip](arhivi/magisterij-primer-sl.zip): primer magistrskega dela
- [magisterij-primer-razclenjen-sl.zip](arhivi/magisterij-primer-razclenjen-sl.zip): primer magistrskega dela s poglavji v posameznih datotekah
- [magisterij-primer-en.zip](arhivi/magisterij-primer-en.zip): primer magistrskega dela v angleščini

in sledite spodnjim [navodilom za uporabo](#navodila-za-uporabo). Dokument bi se moral prevesti brez posebnosti in dodatnih nastavitev. Nekaj pogostih težav in rešitev je [opisanih spodaj](#odpravljanje-napak).

Za pomoč pri razvoju se zahvaljujemo Aniti Buckley (za pomoč pri poenotenju in uvedbi PDF/A formata), Maji Klavžar (za natančna navodila glede navajanja literature), Matjažu Konvalinki (kot skrbniku za vse potrebne informacije), Anji Petković (za angleški primer magistrskega dela) in Sašu Strletu (za prvo različico predloge za diplomsko delo).

_Razvijalci_: Luna Strah, Jure Slak, [Matija Pretnar](https://matija.pretnar.info/), Gašper Golob in Katja Berčič.

## Navodila za uporabo

Za urejanje dokumentov močno priporočamo [Visual Studio Code](https://code.visualstudio.com) s podaljškom [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) in podaljškom za črkovanje [LTeX](https://marketplace.visualstudio.com/items?itemName=valentjn.vscode-ltex). Za preverjanje črkovanja neodvisno od urejevalnika lahko uporabite [aspell](http://aspell.net/).

V LaTeX dokumentu pod komentarjem `% naslednje ukaze ustrezno dopolnite` izpolnite ime avtorja, mentorja, morebitnega somentorja, naslov dela in ostalo. Ti ukazi se uporabijo v generiranju naslovnice, izjave, povzetka in PDF metapodatkov.

Predloga podpira arhivski standard [PDF/A-2b](https://en.wikipedia.org/wiki/PDF/A), ki mu mora zadoščati vaše zaključno delo, ko ga boste oddali preko VIS-a. Med prevajanjem se samodejno pripravijo ustrezni metapodatki in zaznamki za poglavja, ki jih lahko vidite v drevesni strukturi v pregledovalniku PDF dokumentov. Na tem mestu lahko včasih nastopijo težave z matematičnimi znaki v naslovu ali poglavjih, če jih pregledovalnik PDF dokumentov ne prebavi. V tem primeru se avtomatsko izpustijo, če pa jih želimo zamenjati z golim besedilom (plain text) ali UTF-8 znaki, pa lahko to storimo z `\texorpdfstring`, kot je prikazano na primeru v predlogi.

Vaš PDF pred oddajo (ali pa že kdaj prej) preverite z uporabo spletnega validatorja [PDFForge](https://www.pdfforge.org/pdfcreator-online/en/validate-pdfa) ali pa z validatorjem [veraPDF](https://openpreservation.org/tools/verapdf/), ki ga lahko namestite na svoj računalnik.

## Odpravljanje napak

Če imate težavo s predlogo:

1. Najprej **počistite dodatne datoteke** (`.log`, `.aux` ipd.), v katerih se lahko stare napake zadržujejo dlje, kot je treba. V urejevalniku Visual Studio Code to naredite tako, da v paleti ukazov (Command Palette, <kbd>Ctrl+Shift+P</kbd> oz. <kbd>Cmd+Shift+P</kbd> na macOS) natipkate `Clean Auxiliary Files`. Tam bo pisalo tudi, s katero bližnjico pridete do te funkcije na vašem računalniku. Alternativno lahko v ukazni vrstici poženete ukaz `latexmk -c`.
2. V [spodnjem seznamu](#seznam-najpogostejših-napak) poiščite napako, ki jo imate, sledite navodilom ter **ponovite 1. korak**.
3. Če napake na seznamu ne najdete, stopite v stik z razvijalci ali odprite [issue na GitHubu](https://github.com/ul-fmf/fmfdelo/issues/new). **V nobenem primeru ne spreminjajte datoteke `fmfdelo.cls` ali strukture predloge**, saj je šlo zaradi formata PDF/A v predlogo veliko truda in bo spreminjanje bolj kot ne še kaj dodatno pokvarilo.

### Seznam najpogostejših napak

#### `pdfapart undefined`

Če dobite pri prevajanju napako podobno `! Package keyval Error: pdfapart undefined.`, priporočamo, da posodobite svojo distribucijo LaTeX-a na najnovejšo verzijo.

#### `./fmfdelo.cls  ! Undefined control sequence.`

Če dobite napako oblike

    (./fmfdelo.cls
    ! Undefined control sequence.
    \UseTextAccent ...up \@firstofone \let \@curr@enc
                                                    \cf@encoding \@use@text@en...
    l.2 ...fmfdelo}[2016/10/13 Zaključna dela na FMF]

morate posodobiti `.cls` datoteko na najnovejšo verzijo.

#### `The value of the key SMask ...` / `The key S has a value ...`

Napaki `The value of the key SMask is an image but must be None.` ali `The key S has a value Transparency which is prohibited.` pomenita, da imate vključeno kakšno prosojno sliko. Za rastrske slike je ponavadi dovolj, da s primernim programom prosojno barvo spremenite v belo, za slike v vektorskih formatih pa je potrebno ponavadi nastaviti ozadje.

#### Manjkajoče velike začetnice v literaturi

BibTeX pri navajanju literature odvisno od stila spreminja velikost črk, na primer

    title = {Predloge za zaključna dela na FMF UL}

se bo lahko odvisno od vrste vira izpisalo kot _Predloge za zaključna dela na Fmf Ul_ ali _Predloge za zaključna dela na fmf ul_. Če želite vsiliti svojo velikost, morate besedilo zaščiti z `{}`, na primer

    title = {Predloge za zaključna dela na {FMF UL}}

#### Neveljaven znak na začetku datoteke

Če vam LaTeX (ali kakšno drugo orodje) javlja napako pred prvim znakom datoteke, tudi če ga pobrišete, gre najverjetneje za [BOM](https://en.wikipedia.org/wiki/Byte_order_mark), poseben neviden znak na začetku datoteke. Znebite se ga tako, da v Visual Studio Code spodaj kliknete na `UTF-8 with BOM` ter izberete `Save with encoding > UTF-8`.

#### Ostale napake

Še enkrat, če napake na seznamu ne najdete, **ne spreminjajte datoteke ali strukture predloge**, temveč opozorite razvijalce, da jo lahko preprečimo tudi za ostale uporabnike.
