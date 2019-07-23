\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fmfdelo}[2016/10/13 Zakljucna dela na FMF]

%-----------------------------------------------------------------------------
%                       Pomozni ukazi in spremenljivke
%-----------------------------------------------------------------------------

% Nalozimo pakete, ki ponujajo enostavno programiranje.
\RequirePackage{etoolbox, ifthen, keyval}

% Definiramo pomozne ukaze.
\newcommand{\@ifthen}[2]{\ifthenelse{#1}{#2}{\relax}}
\newcommand{\@unless}[2]{\ifthenelse{#1}{\relax}{#2}}
\newcommand{\@blank}[1]{\equal{#1}{}}

\newboolean{@brezpaketov}         % Ali naj ne nalozimo dodatnih paketov?

%-----------------------------------------------------------------------------
%                                   Opcije
%-----------------------------------------------------------------------------

% brezpaketov: neobveznih paketov ne nalozimo
\DeclareOption{brezpaketov}{\setboolean{@brezpaketov}{true}}
\DeclareOption{mat1}{\def\@program{Matematika}\def\@stopnja{1.~stopnja}\def\@tipdela{Delo diplomskega seminarja}}
\DeclareOption{fin1}{\def\@program{Finan\v{c}na matematika}\def\@stopnja{1.~stopnja}\def\@tipdela{Delo diplomskega seminarja}}
\DeclareOption{isrm1}{\def\@program{Interdisciplinarni \v{s}tudij ra\v{c}unalni\v{s}tva in matematike}\def\@stopnja{1.~stopnja}\def\@tipdela{Delo diplomskega seminarja}}
\DeclareOption{mat2}{\def\@program{Matematika}\def\@stopnja{2.~stopnja}\def\@tipdela{Magistrsko delo}}
\DeclareOption{fin2}{\def\@program{Finan\v{c}na matematika}\def\@stopnja{2.~stopnja}\def\@tipdela{Magistrsko delo}}
\DeclareOption{isrm2}{\def\@program{Interdisciplinarni \v{s}tudij ra\v{c}unalni\v{s}tva in matematike}\def\@stopnja{2.~stopnja}\def\@tipdela{Magistrsko delo}}

% vse ostale moznosti (fleqn, twocolumn, ...) podamo naprej v paket article
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{amsart}}

\ProcessOptions\relax

%-----------------------------------------------------------------------------
%                             Nalaganje paketov
%-----------------------------------------------------------------------------
% Za osnovo si vzamemo amsart ter nalozimo pakete.
\LoadClass[12pt, a4paper]{amsart}
\@unless{\boolean{@brezpaketov}}{
  \RequirePackage{amsfonts,amsmath,amssymb}
  \RequirePackage[slovene]{babel}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T1]{fontenc}
  \RequirePackage{silence}
  \WarningFilter{hyperref}{Option}
  \RequirePackage{hyperxmp}
  \RequirePackage[pdfa,pdfapart=1,pdfaconformance=B]{hyperref}

  % algorithms
  \RequirePackage{algpseudocode}  % za psevdokodo
  \RequirePackage{algorithm}      % za
  \floatname{algorithm}{Algoritem}
  \renewcommand{\listalgorithmname}{Kazalo algoritmov}
  \algnewcommand\algorithmicto{\textbf{to}}
  \algnewcommand\algorithmicin{\textbf{in}}
  \algnewcommand\algorithmicforeach{\textbf{for each}}
  \algrenewtext{For}[3]{\algorithmicfor\ #1 $\gets$ #2\ \algorithmicto\ #3\ \algorithmicdo}
  \algdef{S}[FOR]{ForEach}[2]{\algorithmicforeach\ #1\ \algorithmicin\ #2\ \algorithmicdo}
}
\newcommand{\zapisiMetaPodatke}{
  \hypersetup{pdfencoding=auto, psdextra, pdflang=sl, % ali 'en' za anglesicno
    bookmarksopen, bookmarksdepth=3,
    pdfauthor=\@avtor,
    pdftitle=\@naslov,
    pdfproducer={pdfTeX},
    pdfsubject={matematika},
    pdfkeywords=\@kljucnebesede}
  \RequirePackage[a-1b]{pdfx}
  \let\C\undefined
}

%-----------------------------------------------------------------------------
%                                Dimenzije
%-----------------------------------------------------------------------------

% ne spreminjaj podatkov, ki vplivajo na obliko strani
\textwidth 15cm
\textheight 24cm
\oddsidemargin.5cm
\evensidemargin.5cm
\topmargin-5mm
\addtolength{\footskip}{10pt}
\pagestyle{plain}
\overfullrule=15pt

%-----------------------------------------------------------------------------
%                             Oblikovanje glave
%-----------------------------------------------------------------------------
\def\@mentorji{}
\newcommand{\dodajmentorja}[2]{%
  \g@addto@macro\@mentorji{#1: & #2 \\}%
}
\newcommand{\dodajdvamentorja}[3]{%
  \g@addto@macro\@mentorji{#1: & #2 \\ & #3 \\}%
}
\newcommand{\mentor}[1]{\dodajmentorja{Mentor}{#1}}
\newcommand{\somentor}[1]{\dodajmentorja{Somentor}{#1}}
\newcommand{\mentorica}[1]{\dodajmentorja{Mentorica}{#1}}
\newcommand{\somentorica}[1]{\dodajmentorja{Somentorica}{#1}}
\newcommand{\mentorja}[2]{\dodajdvamentorja{Mentorja}{#1}{#2}}
\newcommand{\somentorja}[2]{\dodajdvamentorja{Somentorja}{#1}{#2}}
\newcommand{\mentorici}[2]{\dodajdvamentorja{Mentorici}{#1}{#2}}
\newcommand{\somentorici}[2]{\dodajdvamentorja{Somentorici}{#1}{#2}}
\newcommand{\program}[1]{\def\@program{#1}}
\newcommand{\avtor}[1]{\def\@avtor{#1}}
\newcommand{\naslov}[1]{\def\@naslov{#1}}
\renewcommand{\title}[1]{\def\@title{#1}}
\newcommand{\letnica}[1]{\def\@letnica{#1}}
\newcommand{\povzetek}[1]{\def\@povzetek{#1}}
\renewcommand{\abstract}[1]{\def\@abstract{#1}}
\newcommand{\klasifikacija}[1]{\def\@klasifikacija{#1}}
\newcommand{\kljucnebesede}[1]{\def\@kljucnebesede{#1}}
\renewcommand{\keywords}[1]{\def\@keywords{#1}}

% ukazi za matematicna okolja
\theoremstyle{definition} % tekst napisan pokoncno
\newtheorem{definicija}{Definicija}[section]
\newtheorem{primer*}[definicija]{Primer}
\newtheorem{opomba}[definicija]{Opomba}
\newtheorem{zgled*}[definicija]{Zgled}

\newenvironment{dokaz}[1][Dokaz]{\begin{proof}[#1]}{\end{proof}}
\newenvironment{primer}[1][]{\begin{primer*}[#1]\renewcommand*{\qedsymbol}{$\diamondsuit$}\pushQED{\qed}}{\popQED\end{primer*}}
\newenvironment{zgled}[1][]{\begin{zgled*}[#1]\renewcommand*{\qedsymbol}{$\diamondsuit$}\pushQED{\qed}}{\popQED\end{zgled*}}

\theoremstyle{plain} % tekst napisan posevno
\newtheorem{lema}[definicija]{Lema}
\newtheorem{izrek}[definicija]{Izrek}
\newtheorem{trditev}[definicija]{Trditev}
\newtheorem{posledica}[definicija]{Posledica}

% ukaz za slovarsko geslo
\newcommand{\geslo}[2]{\noindent\textbf{#1}\hspace*{3mm}\hangindent=\parindent\hangafter=1 #2\par}

% Ukaz za izpis začetnih strani.
\AfterEndPreamble{%

% od tod do povzetka ne spreminjaj nicesar
\thispagestyle{empty}
\noindent{\large
UNIVERZA V LJUBLJANI\\[1mm]
FAKULTETA ZA MATEMATIKO IN FIZIKO\\[5mm]
\@program\ -- \@stopnja}
\vfill

\begin{center}{\large
\@avtor\\[2mm]
{\bf \@naslov}\\[10mm]
\@tipdela\\[1cm]
\begin{tabular}{rl} \@mentorji \end{tabular}
}
\end{center}
\vfill

\noindent{\large
Ljubljana, \@letnica}
\pagebreak

\thispagestyle{empty}
\tableofcontents
\pagebreak

\thispagestyle{empty}
\begin{center}
{\bf \@naslov}\\[3mm]
{\sc Povzetek}
\end{center}
\@povzetek
\vfill
\begin{center}
{\bf \@title}\\[3mm]
{\sc Abstract}
\end{center}
\@abstract
\vfill\noindent
{\bf Math. Subj. Class. (2010):} \@klasifikacija \\[1mm]
{\bf Ključne besede:} \@kljucnebesede \\[1mm]
{\bf Keywords:} \@keywords
\pagebreak
}
