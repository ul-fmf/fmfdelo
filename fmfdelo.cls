\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fmfdelo}[2023/01/20 Zakljucna dela na FMF]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NALAGANJE PAKETOV
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[12pt, a4paper]{amsart}
\RequirePackage{amsfonts,amsmath,amssymb}
\RequirePackage[slovene]{babel}
\RequirePackage{bibentry}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{newfile}
\RequirePackage{etoolbox}
\RequirePackage{ifthen}
\RequirePackage{keyval}

\newcommand{\@ifthen}[2]{\ifthenelse{#1}{#2}{\relax}}
\newcommand{\@unless}[2]{\ifthenelse{#1}{\relax}{#2}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OPCIJE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newboolean{@drugastopnja}
\newboolean{@enovitistudij}
\newboolean{@fri}

\DeclareOption{mat1}{
  \def\@program{Matematika}
}
\DeclareOption{fin1}{
  \def\@program{Finančna matematika}
}
\DeclareOption{mat2}{
  \def\@program{Matematika}
  \setboolean{@drugastopnja}{true}
}
\DeclareOption{fin2}{
  \def\@program{Finančna matematika}
  \setboolean{@drugastopnja}{true}
}
\DeclareOption{isrm2}{
  \def\@program{Interdisciplinarni študij računalništva in matematike}
  \setboolean{@drugastopnja}{true}
  \setboolean{@fri}{true}
}
\DeclareOption{ped}{
  \def\@program{Pedagoška matematika}
  \setboolean{@drugastopnja}{true}
  \setboolean{@enovitistudij}{true}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{amsart}}

\ProcessOptions\relax
\ifthenelse{\boolean{@drugastopnja}}{
  \def\@stopnja{2. stopnja}
  \def\@tipdela{Magistrsko delo}
}{
  \def\@stopnja{1. stopnja}
  \def\@tipdela{Delo diplomskega seminarja}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% VNOS METAPODATKOV
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\@definefield}[2]{
  % \definefield{@imepolja}{...} načeloma naredi \def\@imepolja{...},
  % le da pri tem iz ... pobriše presledke
  % Iz imena ukaza dobimo ukaz s pomočjo \csname kot
  %   \csname imeukaza\endcsname ~> \imeukaza
  % Če bi napisali \def\csname @imepolja\endcsname{...} bi to povozilo ukaz
  % \csname, zato moramo uporabiti \expandafter, da najprej izvedemo \csname,
  % šele nato \def.
  \expandafter\def\csname #1\endcsname{\ifblank{#2}{}{#2}}
}
\newcommand{\@definerequiredfield}[2]{
  \@definefield{#1}{#2}
  {
    % Ker ključne besede vsebujejo nedefinirano ločilo \sep, ga za potrebe
    % preverjanja lokalno definiramo (zato par zavitih oklepajev).
    \newcommand\sep{\relax}
    \@ifthen{\equal{\csname #1\endcsname}{}}{
      \PackageError{fmfdelo}{Polje je zahtevano.}{}
    }
  }
}
\def\@mentorji{}
\def\@podpisi{}
\newcommand{\@dodajmentorja}[3]{%
  \g@addto@macro\@mentorji{#1: & #3 \\}%
  \g@addto@macro\@podpisi{Podpis #2: & \phantom{prostor za podpis} \\[2cm]}%
}
\newcommand{\@dodajdvamentorja}[4]{%
  \g@addto@macro\@mentorji{#1: & #3 \\ & #4 \\}%
  \g@addto@macro\@podpisi{Podpisa #2: & \phantom{prostor za podpis} \\[2cm] & \phantom{prostor za podpis} \\[2cm]}
}

\newcommand{\avtor}{\@definerequiredfield{@avtor}}
\newcommand{\naslov}{\@definerequiredfield{@naslov}}
\renewcommand{\title}{\@definerequiredfield{@title}}
\newcommand{\letnica}{\@definerequiredfield{@letnica}}
\newcommand{\zahvala}{\@definefield{@zahvala}}
\newcommand{\programdela}{\@definefield{@programdela}}
\newcommand{\osnovnaliteratura}{\@definefield{@osnovnaliteratura}}
\newcommand{\povzetek}{\@definerequiredfield{@povzetek}}
\renewcommand{\abstract}{\@definerequiredfield{@abstract}}
\newcommand{\klasifikacija}{\@definerequiredfield{@klasifikacija}}
\newcommand{\kljucnebesede}{\@definerequiredfield{@kljucnebesede}}
\renewcommand{\keywords}{\@definerequiredfield{@keywords}}
\newcommand{\slovar}{\@definefield{@slovar}}
\newcommand{\literatura}{\@definefield{@literatura}}

\newcommand{\vnosliterature}[1]{\item[\cite{#1}] \bibentry{#1}}
\newcommand{\geslo}[2]{\noindent\textbf{#1}\hspace*{3mm}\hangindent=\parindent\hangafter=1 #2\par}

\newcommand{\mentor}{\@dodajmentorja{Mentor}{mentorja}}
\newcommand{\somentor}{\@dodajmentorja{Somentor}{somentorja}}
\newcommand{\mentorica}{\@dodajmentorja{Mentorica}{mentorice}}
\newcommand{\somentorica}{\@dodajmentorja{Somentorica}{somentorice}}
\newcommand{\mentorja}{\@dodajdvamentorja{Mentorja}{mentorjev}}
\newcommand{\somentorja}{\@dodajdvamentorja{Somentorja}{somentorjev}}
\newcommand{\mentorici}{\@dodajdvamentorja{Mentorici}{mentoric}}
\newcommand{\somentorici}{\@dodajdvamentorja{Somentorici}{somentoric}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IZPIS PDF/A
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
\protect\Subject{\@tipdela, \@program, \@klasifikacija}
}
\closeoutputstream{xmpdatafile}

\let\texorpdfstring\oldtexorpdfstring

\makeatletter\let\saved@bibitem\@bibitem\makeatother
% Nalozimo paket za zagotavljanje PDF/A-2B (ustrezni fonti, barvni profili, UTF-8 zapis simbolov, ...)
\RequirePackage[a-2b]{pdfx}
\makeatletter\let\@bibitem\saved@bibitem\makeatother
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DIMENZIJE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\textwidth 15cm
\textheight 24cm
\oddsidemargin.5cm
\evensidemargin.5cm
\topmargin-5mm
\addtolength{\footskip}{10pt}
\overfullrule=15pt

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RAZNO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% pokončno napisan tekst
\theoremstyle{definition}
\newtheorem{aksiom}{Aksiom}
\newtheorem{definicija}{Definicija}[section]
\newtheorem{opomba}[definicija]{Opomba}
\newtheorem{primer*}[definicija]{Primer}
\newenvironment{primer}[1][]{
  \begin{primer*}[#1]\renewcommand*{\qedsymbol}{$\diamondsuit$}\pushQED{\qed}
}{
  \popQED\end{primer*}
}
\newtheorem{zgled*}[definicija]{Zgled}
\newenvironment{zgled}[1][]{
  \begin{zgled*}[#1]\renewcommand*{\qedsymbol}{$\diamondsuit$}\pushQED{\qed}
}{
  \popQED\end{zgled*}
}

 % poševno napisan tekst
\theoremstyle{plain}
\newtheorem{lema}[definicija]{Lema}
\newtheorem{izrek}[definicija]{Izrek}
\newtheorem{trditev}[definicija]{Trditev}
\newtheorem{posledica}[definicija]{Posledica}

\numberwithin{equation}{section}  % števec za enačbe zgleda kot (2.7) in se resetira v vsakem razdelku
\newenvironment{dokaz}[1][Dokaz]{\begin{proof}[#1]}{\end{proof}}

% bold matematika znotraj \textbf{ }, tudi v naslovih
\g@addto@macro\bfseries{\boldmath}

% Poimenuj kazalo slik kot ``Kazalo slik'' in ne ``Slike''
\addto\captionsslovene{
  \renewcommand{\listfigurename}{Kazalo slik}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IZPIS ZAČETNIH STRANI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AfterEndPreamble{%
\pagestyle{plain}
\thispagestyle{empty}
\noindent{\large
UNIVERZA V LJUBLJANI\\[1mm]
FAKULTETA ZA MATEMATIKO IN FIZIKO
\@ifthen{\boolean{@fri}}{\\[1mm]FAKULTETA ZA RAČUNALNIŠTVO IN INFORMATIKO}
\\[5mm]
\@program\@unless{\boolean{@enovitistudij}}{\ -- \@stopnja}}
\vfill

\begin{center}{\large
\@avtor\\[2mm]
\textbf{\@naslov}\\[10mm]
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
  \nobibliography*
  \begin{itemize}
  \@osnovnaliteratura
  \end{itemize}

  \vspace{2cm}
  \begin{flushright}
    \begin{tabular}{rp{4cm}} \@podpisi \end{tabular}
  \end{flushright}
  \vfill
  \clearpage
}

\thispagestyle{empty}
\begin{center}
\textbf{\@naslov}\\[3mm]
\textsc{Povzetek}
\end{center}
\@povzetek
\vfill
\begin{center}
\textbf{\@title}\\[3mm]
\textsc{Abstract}
\end{center}
\@abstract
\vfill\noindent
\textbf{Math. Subj. Class. (2020):} \@klasifikacija \\[1mm]
\def\sep{, } % Pri izpisu ključne besede ločimo z vejico.
\textbf{Ključne besede:} \@kljucnebesede \\[1mm]
\textbf{Keywords:} \@keywords
\clearpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IZPIS KONČNIH STRANI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtEndDocument{%
\bibliographystyle{fmf-sl}
\ifdef{\@slovar}{%
\section*{Slovar strokovnih izrazov}
\@slovar
}
\ifdef{\@literatura}{%
  \bibliography{\@literatura}
}{\relax}
}
