\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fmfdelo}[2022/12/22 Zakljucna dela na FMF]

%-----------------------------------------------------------------------------
%                       Pomozni ukazi in spremenljivke
%-----------------------------------------------------------------------------

% Nalozimo pakete, ki ponujajo enostavno programiranje.
\RequirePackage{etoolbox, ifthen, keyval}

% Nalozimo paket za ustvarjanje .xmpdata datoteke, ki jo potrebuje paket pdfx
% Okolja filecontents ne moremo uporabiti, ker se ga ne da poklicati v makroju.
\RequirePackage{newfile}

% Definiramo pomozne ukaze.
\newcommand{\@ifthen}[2]{\ifthenelse{#1}{#2}{\relax}}
\newcommand{\@unless}[2]{\ifthenelse{#1}{\relax}{#2}}
\newcommand{\@blank}[1]{\equal{#1}{}}

\newboolean{@brezpaketov}         % Ali naj ne nalozimo dodatnih paketov?
\newboolean{@drugastopnja}
\newboolean{@fri}

%-----------------------------------------------------------------------------
%                                   Opcije
%-----------------------------------------------------------------------------

% brezpaketov: neobveznih paketov ne nalozimo
\DeclareOption{brezpaketov}{\setboolean{@brezpaketov}{true}}
\DeclareOption{mat1}{\def\@program{Matematika}\def\@stopnja{1.~stopnja}\def\@tipdela{Delo diplomskega seminarja}}
\DeclareOption{fin1}{\def\@program{Finan\v{c}na matematika}\def\@stopnja{1.~stopnja}\def\@tipdela{Delo diplomskega seminarja}}
\DeclareOption{mat2}{\def\@program{Matematika}\def\@stopnja{2.~stopnja}\def\@tipdela{Magistrsko delo}\setboolean{@drugastopnja}{true}}
\DeclareOption{fin2}{\def\@program{Finan\v{c}na matematika}\def\@stopnja{2.~stopnja}\def\@tipdela{Magistrsko delo}\setboolean{@drugastopnja}{true}}
\DeclareOption{isrm2}{\def\@program{Interdisciplinarni \v{s}tudij ra\v{c}unalni\v{s}tva in matematike}\def\@stopnja{2.~stopnja}\def\@tipdela{Magistrsko delo}\setboolean{@drugastopnja}{true}\setboolean{@fri}{true}}

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
\def\@podpisi{}
\newcommand{\dodajpodpis}[1]{%
  \g@addto@macro\@podpisi{Podpis #1: & \phantom{prostor za podpis} \\[2cm]}%
}
\newcommand{\dodajdvapodpisa}[1]{%
  \g@addto@macro\@podpisi{Podpisa #1: & \phantom{prostor za podpis} \\[2cm] & \phantom{prostor za podpis} \\[2cm]}
}
\newcommand{\mentor}[1]{\dodajmentorja{Mentor}{#1}\dodajpodpis{mentorja}}
\newcommand{\somentor}[1]{\dodajmentorja{Somentor}{#1}\dodajpodpis{somentorja}}
\newcommand{\mentorica}[1]{\dodajmentorja{Mentorica}{#1}\dodajpodpis{mentorice}}
\newcommand{\somentorica}[1]{\dodajmentorja{Somentorica}{#1}\dodajpodpis{somentorice}}
\newcommand{\mentorja}[2]{\dodajdvamentorja{Mentorja}{#1}{#2}\dodajdvapodpisa{mentorjev}}
\newcommand{\somentorja}[2]{\dodajdvamentorja{Somentorja}{#1}{#2}\dodajdvapodpisa{somentorjev}}
\newcommand{\mentorici}[2]{\dodajdvamentorja{Mentorici}{#1}{#2}\dodajdvapodpisa{mentoric}}
\newcommand{\somentorici}[2]{\dodajdvamentorja{Somentorici}{#1}{#2}\dodajdvapodpisa{somentoric}}
\newcommand{\program}[1]{\def\@program{#1}}
\newcommand{\avtor}[1]{\def\@avtor{#1}}
\newcommand{\naslov}[1]{\def\@naslov{#1}}
\renewcommand{\title}[1]{\def\@title{#1}}
\newcommand{\letnica}[1]{\def\@letnica{#1}}
\newcommand{\zahvala}[1]{\def\@zahvala{#1}}
\newcommand{\programdela}[1]{\def\@programdela{#1}}
\newcommand{\osnovnaliteratura}[1]{\def\@osnovnaliteratura{#1}}
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
\newtheorem{aksiom}{Aksiom}

\numberwithin{equation}{section}  % števec za enačbe zgleda kot (2.7) in se resetira v vsakem razdelku
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

% ukaz za literaturo
\newcommand{\literatura}[1]{\def\@literatura{#1}}

\AtEndPreamble{%
\let\oldtexorpdfstring\texorpdfstring
\renewcommand{\texorpdfstring}[2]{#2}
\let\sep{\protect\sep}
\newoutputstream{xmpdatafile}
\openoutputfile{\jobname.xmpdata}{xmpdatafile}
\addtostream{xmpdatafile}{%
\protect\Title{\@naslov}
\protect\Author{\@avtor}
\protect\Keywords{\@kljucnebesede}
\protect\Subject{matematika}
}
\closeoutputstream{xmpdatafile}

\let\texorpdfstring\oldtexorpdfstring

% Nalozimo paket za zagotavljanje PDF/A-2B (ustrezni fonti, barvni profili, UTF-8 zapis simbolov, ...)
\RequirePackage[a-2b]{pdfx}

% bold matematika znotraj \textbf{ }, tudi v naslovih
\makeatletter \g@addto@macro\bfseries{\boldmath} \makeatother

% Poimenuj kazalo slik kot ``Kazalo slik'' in ne ``Slike''
\addto\captionsslovene{
  \renewcommand{\listfigurename}{Kazalo slik}%
}
}

% Ukaz za izpis začetnih strani.
\AfterEndPreamble{%
\def\sep{, }
% od tod do povzetka ne spreminjaj nicesar
\thispagestyle{empty}
\noindent{\large
UNIVERZA V LJUBLJANI\\[1mm]
FAKULTETA ZA MATEMATIKO IN FIZIKO
\@ifthen{\boolean{@fri}}{\\[1mm]FAKULTETA ZA RAČUNALNIŠTVO IN INFORMATIKO}
\\[5mm]
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
\cleardoublepage

\ifdefined\@zahvala
  \section*{Zahvala}
  \@zahvala
  \vfill
  \clearpage
\fi

\thispagestyle{empty}
\pdfbookmark[1]{\contentsname}{kazalo-vsebine}
\tableofcontents
\vfill
\clearpage

\@ifthen{\boolean{@drugastopnja}}{
  \section*{Program dela}
  \@programdela

  \section*{Osnovna literatura}
  \@osnovnaliteratura

  \vspace{2cm}
  \begin{flushright}
    \begin{tabular}{rp{4cm}} \@podpisi \end{tabular}
  \end{flushright}
  \vfill
  \clearpage
}

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
{\bf Math. Subj. Class. (2020):} \@klasifikacija \\[1mm]
{\bf Ključne besede:} \@kljucnebesede \\[1mm]
{\bf Keywords:} \@keywords
\clearpage
}

\AtEndDocument{%
% Ukazi za izpis virov
\bibliographystyle{fmf-sl}
\ifdef{\@literatura}{%
  \bibliography{\@literatura}
}{\relax}
}