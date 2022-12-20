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
vidimo`. Pazite na predolge presledke po pikah za kraticami, kot so "npr., t. i., tj." ipd. Tam
uporabite `\ ` ali `~`, kot npr. `t.~i.\ ` ali `t.~i.~`. Za pisanje enačb uporabljajte `\[ \]`, `equation`, `align` ali `align*`
okolja in ne `eqnarray` ipd.

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

## PDF metapodatki
Med prevajanjem se bodo avtomarsko nastavili PDF metapodatki o avtorju in naslovu (vidite v
titlebaru PDF readerja).  Poleg tega se bodo zgenerirali tudi zaznamki za poglajva in podpoglavja v
PDF (vidni na levi strani kot drevesna struktura).  Tu so lahko težave z matematičnimi/UTF-8 znaki v
nadlovih naloge ali poglavjih, ki jih PDF reader ne prebavi. V tem primeru se avtomatsko izpustijo,
če pa jih želimo zamenjati s plain-text/UTF-8 znaki pa lahko to storigmo z `\texorpdfstring`, kot
prikazano na primeru v predlogi.

## Pisanje algoritmov in vključevanje izvorne kode
Za vključevanje izvorne kode inpisanje algoritmov v psevdokodi so v predlogi že zakomentirani
primerni ukazi za vključevajne paketov. Za vključevanje izvorne kode priporočamo paket
[minted](https://github.com/gpoore/minted), za pisanje algoritmov pa
[algoritmx](http://tug.ctan.org/macros/latex/contrib/algorithmicx/algorithmicx.pdf).  Za primer
uporabe glej predlogo za [diplomski seminar](../delo_diplomskega_seminarja/README.md).
