# Splošno o predlogah za zaključna dela na FMF

Na tem repozitoriju boste našli predloge za dela diplomskega seminarja in magistrska dela na OM FMF.
Pred uporabo predloge, **prosim preberite navodila na vaši spletni učilnici in spodnja tehnična
navodila**. Nato kliknite na ustrezno mapo zgoraj ([magisterij](magistrsko_delo/) ali
[diploma](delo_diplomskega_seminarja/)), preberite navodila za uporabo predloge, prenesite in
začnite pisati.

## Citiranje literature

LaTeX preko sistema [BibTeX](http://www.bibtex.org/) podpira avtomatsko navajanje literature.
Vse kar je potrebno narediti je na koncu datoteke napisati
```
\bibliographystyle{fmf-sl}
\bibliography{literatura}
```
namesto običajnega okolja `thebibliography`.
Narediti je potrebno še datoteko `literatura.bib`, ki vsebuje vnose kot npr:
```
@Article{kearsley1975linearly,
  author  = {Kearsley, Elliot A and Fong, JT},
  title   = {{Linearly independent sets of isotropic Cartesian tensors of ranks up to eight}},
  journal = {J. Res. Natl Bureau of Standards Part B: Math. Sci. B},
  year    = {1975},
  volume  = {79},
  pages   = {49--58},
  doi     = {10.6028/jres.079b.005}
}
```

LaTeX nato poskrbi, da se vsak vnos iz datoteke `literatura.bib`, ki je tudi citiran v dokumentu s
pomočjo `\cite{label}` se pojavi na končnem seznamu literature, ki je avtomatsko pravilno oblikovan
in urejen. V `fmf-sl.bst` datoteki je definiran stil navajanja literature, ki ustreza [navodilom za
navajanje literature](https://www.fmf.uni-lj.si/storage/24240/LiteraturaM.pdf).

Najpogostejši tipi citatov so `@article` za članke, `@book` za knjige, `@phdthesis`,
`@mastersthesis` in `@bachelorsthesis` za doktorate, magisterije in diplome, `@inproceedings` za
konference in `@misc` za ostalo (ponavadi splene naslove). Seznam literature se obravnava kot
običajno LaTeX kodo, tako da se lahko v njej uporablja tudi matematiko `$...$` in je potrebno
escapati vse posebne znake (npr. `#`, `%`, ...). Vnose za BibTeX datoteko pogosto dobite kar na
strani, kjer ste članek dobili. Če pa ne, ga najverjetneje lahko [poiščete na Google
Scholar-ju](https://scholar.google.si/scholar?hl=en&as_sdt=0%2C5&q=Linearly+independent+sets+of+isotropic+Cartesian+tensors+of+ranks+up+to+eight&btnG=),
kliknete na ikono `''`, izberete BibTeX in skopirate podatke. **Podatke o članku ali knjigi je
potrebno vedno ročno preveriti, saj so lahko narobe.**
Članki so avtomatko abecedno urejeni po priimku in nato imenu prvega avtorja. Člankom brez avtorja
je potrebno dodati polje `key={kljuc}`, ki pove kljuc, glede na katerega se urejajo. Da bi bili ti
članki na koncu besedila in urejeni po npr. spletnih naslovih, je lahko ključ oblike
`žžž-http://...`.

Več o urejanju literature je na voljo
[tukaj](https://en.wikibooks.org/wiki/LaTeX/Bibliography_Management#BibTeX).  Za urejanje `.bib`
datotek priporočam program [JabRef](http://www.jabref.org/), ki zna samodejno okrajšati imena revij,
dobiti DOI člankov in podatke iz ISBN ter lepo oblikuje datoteko. Na voljo je za Windows, Linux in
Mac.

Ta sistem močno priporočam, še vedno pa lahko izbrišete tisti dve vrstici in se vrnete nazaj na
okolje `thebibliography`.

## Prevajanje dokumenta
Če dokument dokument vsebuje zunanjo literaturo (v `.bib` datoteki) ali stvarno kazalo (bolj za
magisterije) je potrebno pri [TeXWorks](https://www.tug.org/texworks/) izbrati za prevajanje opcijo
`pdflatex+bibtex+makeindex`. Za urejanje dokumentov močno priporočam
[TeXStudio](http://www.texstudio.org/), ki zna autocompletati sklice, citate ipd.  Na voljo je za
Windows, Linux in Mac. Za prevajanje s stvarnim kazalom je potrebno `Options > Configure TeXStudio >
Show Advanced Options > Build > PDF Chain` nastaviti na `txs:///pdflatex | txs:///bibtex |
txs:///makeindex | txs:///pdflatex | txs:///pdflatex | txs:///view-pdf`.  (vsebovati mora
`makeindex`). Literatura se prevede avtomatsko brez dodatnih nastavitev.

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

## Pogosta vprašanja
Za težave in vprašanja glede template-a, prosim odprite nov issue, pred tem pa preglejte [že
obstoječe](https://github.com/ul-fmf/fmfdelo/issues?q=is%3Aissue), če morda rešijo
vašo težavo.

## Zahvale
Hvala Anji Petković za angleško verzijo magisterija, Maji Klavžar za natančna navodila glede
navajanja literature, Sašu Strletu in Matjažu Konvalinki kot skrbnikoma programov za vse potrebne
informacije in Aniti Buckley za pomoč pri poenotenju in uvedbi PDF/A formata.

Matija Pretnar & Jure Slak (jure.slak@fmf.uni-lj.si)
