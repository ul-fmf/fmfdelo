\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fmfdelo}[2023/01/20 Zakljucna dela na FMF]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NALAGANJE PAKETOV
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{amsfonts,amsmath,amssymb,amsthm}
\RequirePackage{bibentry}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{newfile}
\RequirePackage{etoolbox}
\RequirePackage{ifthen}
\RequirePackage{keyval}
\RequirePackage{makeidx}

\newcommand{\@ifthen}[2]{\ifthenelse{#1}{#2}{\relax}}
\newcommand{\@unless}[2]{\ifthenelse{#1}{\relax}{#2}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OPCIJE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newboolean{@drugastopnja}
\newboolean{@enovitistudij}
\newboolean{@fri}
\newboolean{@anglescina}
\newboolean{@tisk}
\newboolean{@trst}
\newcommand{\@sloeng}[2]{\ifthenelse{\boolean{@anglescina}}{#2}{#1}}
\newcommand{\@iftrst}[2]{\@ifthen{\boolean{@trst}}{#1}}

\DeclareOption{anglescina}{\setboolean{@anglescina}{true}}
\DeclareOption{mat1}{
  \def\@program{Matematika}
  \def\@programme{Mathematics}
}
\DeclareOption{fin1}{
  \def\@program{Finančna matematika}
  \def\@programme{Financial Mathematics}
}
\DeclareOption{mat2}{
  \def\@program{Matematika}
  \def\@programme{Mathematics}
  \setboolean{@drugastopnja}{true}
}
\DeclareOption{fin2}{
  \def\@program{Finančna matematika}
  \def\@programme{Financial Mathematics}
  \setboolean{@drugastopnja}{true}
}
\DeclareOption{isrm2}{
  \def\@program{Računalništvo in matematika}
  \def\@programme{Computer Science and Mathematics}
  \setboolean{@drugastopnja}{true}
  \setboolean{@fri}{true}
}
\DeclareOption{ped}{
  \def\@program{Pedagoška matematika}
  \def\@programme{Mathematics Education}
  \setboolean{@drugastopnja}{true}
  \setboolean{@enovitistudij}{true}
}
\DeclareOption{tisk}{
  \setboolean{@tisk}{true}
  \PassOptionsToClass{twoside}{article}
}
\DeclareOption{trst1}{
  \setboolean{@anglescina}{true}
  \setboolean{@trst}{true}
  \def\@programme{Programme for a double diploma in mathematics}
  \def\@it@thesistype{Tesi finale}
}
\DeclareOption{trst2}{
  \setboolean{@anglescina}{true}
  \setboolean{@trst}{true}
  \setboolean{@drugastopnja}{true}
  \def\@programme{Programme for a double master's degree in mathematics}
  \def\@it@thesistype{Tesi finale}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax
\LoadClass[12pt, a4paper]{article}
\ifthenelse{\boolean{@drugastopnja}}{
  \def\@stopnja{2. stopnja}
  \def\@tipdela{Magistrsko delo}
  \def\@cycle{2nd cycle}
  \def\@thesistype{Master's thesis}
}{
  \def\@stopnja{1. stopnja}
  \def\@tipdela{Delo diplomskega seminarja}
  \def\@cycle{1st cycle}
  \def\@thesistype{Diploma seminar work}
}

\@sloeng{
  \RequirePackage[slovene]{babel}
}{
  \RequirePackage[slovene,english]{babel}
  \selectlanguage{english}
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
    \def\sep{\relax}
    \@ifthen{\equal{\csname #1\endcsname}{}}{
      \PackageError{fmfdelo}{Polje je zahtevano.}{}
    }
  }
}
\def\@mentorji{}
\def\@supervisors{}
\def\@it@supervisors{}
\def\@podpisi{}
\def\@signatures{}
\def\@it@signatures{}
\newcommand{\@dodajmentorja}[3]{%
  \g@addto@macro\@mentorji{#1: & #3 \\}%
  \g@addto@macro\@podpisi{Podpis #2: & \phantom{prostor za podpis} \\[2cm]}%
}
\newcommand{\@dodajdvamentorja}[4]{%
  \g@addto@macro\@mentorji{#1: & #3 \\ & #4 \\}%
  \g@addto@macro\@podpisi{Podpisa #2: & \phantom{prostor za podpis} \\[2cm] & \phantom{prostor za podpis} \\[2cm]}
}
\newcommand{\@addsupervisor}[3]{%
  \g@addto@macro\@supervisors{#1: & #3 \\}%
  \g@addto@macro\@signatures{#2 signature: & \phantom{prostor za podpis} \\[2cm]}%
}
\newcommand{\@addsupervisors}[4]{%
  \g@addto@macro\@supervisors{#1: & #3 \\ & #4 \\}%
  \g@addto@macro\@signatures{#2 signature: & \phantom{prostor za podpis} \\[2cm] & \phantom{prostor za podpis} \\[2cm]}
}
\newcommand{\@it@addsupervisor}[3]{%
  \g@addto@macro\@it@supervisors{#1: & #3 \\}%
  \g@addto@macro\@it@signatures{Firma del #2: & \phantom{prostor za podpis} \\[2cm]}%
}
\newcommand{\@it@addsupervisors}[4]{%
  \g@addto@macro\@it@supervisors{#1: & #3 \\ & #4 \\}%
  \g@addto@macro\@it@signatures{Firma dei signature: & \phantom{prostor za podpis} \\[2cm] & \phantom{prostor za podpis} \\[2cm]}
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
\newcommand{\keywords}{\@definerequiredfield{@keywords}}
\newcommand{\slovar}{\@definefield{@slovar}}
\newcommand{\literatura}{\@definefield{@literatura}}

\@ifthen{\boolean{@anglescina}}{
  \newcommand{\razsirjenipovzetek}{\@definerequiredfield{@razsirjenipovzetek}}
}

\@ifthen{\boolean{@trst}}{
  \newcommand{\titolo}{\@definerequiredfield{@it@title}}
  \newcommand{\sommario}{\@definerequiredfield{@it@abstract}}
  \newcommand{\parolechiave}{\@definerequiredfield{@it@keywords}}
  \newcommand{\sintesiestesa}{\@definerequiredfield{@it@razsirjenipovzetek}}
}

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
\newcommand{\supervisor}[1]{\@addsupervisor{Supervisor}{Supervisor's}{#1}}
\newcommand{\cosupervisor}[1]{\@addsupervisor{Co-supervisor}{Co-supervisor's}{#1}}
\newcommand{\supervisors}[2]{\@addsupervisors{Supervisors}{Supervisors'}{#1}{#2}}
\newcommand{\cosupervisors}[2]{\@addsupervisors{Co-supervisors}{Co-supervisors'}{#1}{#2}}
\newcommand{\supervisore}[1]{\@it@addsupervisor{Supervisore}{supervisore}{#1}}
\newcommand{\cosupervisore}[1]{\@it@addsupervisor{Co-supervisore}{co-supervisore}{#1}}
\newcommand{\supervisori}[2]{\@it@addsupervisors{Supervisori}{supervisorsi}{#1}{#2}}
\newcommand{\cosupervisori}[2]{\@it@addsupervisors{Co-supervisori}{co-supervisori}{#1}{#2}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IZPIS PDF/A
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtEndPreamble{%
\let\oldtexorpdfstring\texorpdfstring
\renewcommand{\texorpdfstring}[2]{#2}
\let\sep{\protect\sep}
\newoutputstream{xmpdatafile}
\openoutputfile{\jobname.xmpdata}{xmpdatafile}
\ifthenelse{\boolean{@anglescina}}{
  \addtostream{xmpdatafile}{%
  \protect\Title{\@title}
  \protect\Author{\@avtor}
  \protect\Keywords{\@keywords}
  \protect\Subject{\@thesistype, \@programme, \@klasifikacija}
}}{
  \addtostream{xmpdatafile}{%
  \protect\Title{\@naslov}
  \protect\Author{\@avtor}
  \protect\Keywords{\@kljucnebesede}
  \protect\Subject{\@tipdela, \@program, \@klasifikacija}
}}
\closeoutputstream{xmpdatafile}

\let\texorpdfstring\oldtexorpdfstring

\makeatletter\let\saved@bibitem\@bibitem\makeatother
% Nalozimo paket za zagotavljanje PDF/A-2B (ustrezni fonti, barvni profili, UTF-8 zapis simbolov, ...)
\RequirePackage[a-2b]{pdfx}
\makeatletter\let\@bibitem\saved@bibitem\makeatother
\ifthenelse{\boolean{@tisk}}{
  \definecolor{linkcolor}{RGB}{0,0,0}
}{
  \definecolor{linkcolor}{RGB}{0,84,147}
}
\hypersetup{bookmarksopen, bookmarksdepth=3, colorlinks=true,
  linkcolor=linkcolor, anchorcolor=linkcolor, citecolor=linkcolor, filecolor=linkcolor,
  menucolor=linkcolor, runcolor=linkcolor, urlcolor=linkcolor, pdfencoding=auto,
  breaklinks=true, psdextra}
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
\@ifthen{\boolean{@anglescina}}{
\newtheorem{axiom}{Axiom}
\newtheorem{definition}{Definition}[section]
\newtheorem{remark}[definition]{Remark}
\newtheorem{example*}[definition]{Example}
\newenvironment{example}[1][]{
  \begin{example*}[#1]\renewcommand*{\qedsymbol}{$\diamondsuit$}\pushQED{\qed}
}{
  \popQED\end{example*}
}
}

 % poševno napisan tekst
\theoremstyle{plain}
\newtheorem{lema}[definicija]{Lema}
\newtheorem{izrek}[definicija]{Izrek}
\newtheorem{trditev}[definicija]{Trditev}
\newtheorem{posledica}[definicija]{Posledica}
\@ifthen{\boolean{@anglescina}}{
\newtheorem{lemma}[definition]{Lemma}
\newtheorem{theorem}[definition]{Theorem}
\newtheorem{proposition}[definition]{Proposition}
\newtheorem{corollary}[definition]{Corollary}
}
\@ifthen{\boolean{@trst}}{
\newtheorem{teorema}[definition]{Teorema}
\newtheorem{proposizione}[definition]{Proposizione}
\newtheorem{corollario}[definition]{Corollario}
\newenvironment{dimostrazione}[1][Dimostrazione]{\begin{proof}[#1]}{\end{proof}}
}

\numberwithin{equation}{section}  % števec za enačbe zgleda kot (2.7) in se resetira v vsakem razdelku
\newenvironment{dokaz}[1][Dokaz]{\begin{proof}[#1]}{\end{proof}}

% bold matematika znotraj \textbf{ }, tudi v naslovih
\g@addto@macro\bfseries{\boldmath}

% Poimenuj kazalo slik kot ``Kazalo slik'' in ne ``Slike''
\addto\captionsslovene{
  \renewcommand{\listfigurename}{Kazalo slik}%
}

% generiraj vsebinsko kazalo
\makeindex

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IZPIS ZAČETNIH STRANI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\@sloeng{\def\@frontpages{\@frontpages@sl}}{\def\@frontpages{\@frontpages@en}}
\@ifthen{\boolean{@trst}}{\def\@frontpages{\@frontpages@trst}}

\def\@frontpages@sl{
  \@frontpages@sl@naslovnica
  \@frontpages@sl@zahvala
  \@frontpages@common@toc
  \@ifthen{\boolean{@drugastopnja}}{
    \@frontpages@common@program
  }

  \thispagestyle{empty}
  \pdfbookmark[1]{Povzetek}{povzetek}
  \@frontpages@sl@povzetek
  \@frontpages@en@abstract
  \@frontpages@sl@kljucnebesede
  \cleardoublepage
}
\def\@frontpages@en{
  \@frontpages@en@frontpage
  \@frontpages@sl@naslovnica
  \@frontpages@en@acknowledgements
  \@frontpages@common@toc
  \@ifthen{\boolean{@drugastopnja}}{
    \@frontpages@common@program
  }

  \thispagestyle{empty}
  \pdfbookmark[1]{Abstract}{abstract}
  \@frontpages@en@abstract
  \@frontpages@sl@povzetek
  \@frontpages@en@keywords
  \cleardoublepage
}
\def\@frontpages@trst{
  \@frontpages@trst@en@frontpage
  \@frontpages@trst@itslo@frontpage
  \@frontpages@en@acknowledgements
  \@frontpages@common@toc
  \@ifthen{\boolean{@drugastopnja}}{
    \@frontpages@common@program
  }

  \thispagestyle{empty}
  \pdfbookmark[1]{Abstract}{abstract}
  \@frontpages@en@abstract
  \@frontpages@trst@abstract
  \@frontpages@sl@povzetek
  \@frontpages@trst@keywords
  \cleardoublepage
}

\def\@frontpages@common@toc{
  \thispagestyle{empty}
  \pdfbookmark[1]{\contentsname}{kazalo-vsebine}
  \tableofcontents
  \vfill
  \cleardoublepage
}
\def\@frontpages@common@program{
  \@sloeng{
    \pdfbookmark[1]{Program dela}{program}
  }{
    \pdfbookmark[1]{Project plan}{program}
  }
  \@sloeng{\section*{Program dela}}{\section*{Project plan}}
  \@programdela

  \@sloeng{\section*{Osnovna literatura}}{\section*{Basic references}}
  \nobibliography*
  \begin{itemize}
  \@osnovnaliteratura
  \end{itemize}

  \vspace{2cm}
  \begin{flushright}
    \begin{tabular}{rp{4cm}} \@sloeng{\@podpisi}{\@signatures} \end{tabular}
  \end{flushright}
  \vfill
  \cleardoublepage
}
\def\@frontpages@sl@naslovnica{
  \thispagestyle{empty}
  \noindent
  {\large
  UNIVERZA V LJUBLJANI\\[1mm]
  FAKULTETA ZA MATEMATIKO IN FIZIKO
  \@ifthen{\boolean{@fri}}{\\[1mm]FAKULTETA ZA RAČUNALNIŠTVO IN INFORMATIKO}
  \\[5mm]
  \@program\@unless{\boolean{@enovitistudij}}{\ -- \@stopnja}
  }
  \vfill
  \begin{center}
  {\large
  \@avtor\\[2mm]
  {\Large\textbf{\MakeUppercase{\@naslov}}}\\[10mm]
  \@tipdela\\[1cm]
  \begin{tabular}{rl} \@mentorji \end{tabular}
  }
  \end{center}
  \vfill

  \noindent{\large
  Ljubljana, \@letnica}
  \cleardoublepage
}
\def\@frontpages@en@frontpage{
  \thispagestyle{empty}
  \noindent{\large
  UNIVERSITY OF LJUBLJANA\\[1mm]
  FACULTY OF MATHEMATICS AND PHYSICS
  \@ifthen{\boolean{@fri}}{\\[1mm]FACULTY OF COMPUTER AND INFORMATION SCIENCE}
  \\[5mm]
  \@programme\ -- \@cycle}
  \vfill

  \begin{center}{\large
  \@avtor\\[2mm]
  {\Large\textbf{\MakeUppercase{\@title}}}\\[10mm]
  \@thesistype\\[1cm]
  \begin{tabular}{rl} \@supervisors \end{tabular}
  }
  \end{center}
  \vfill

  \noindent{\large
  Ljubljana, \@letnica}
  \cleardoublepage
}
\newcommand{\dvastolpca}[3][0.45]{
  \hfill
  \parbox{#1\linewidth}{
    \center #2
  }
  \hfill
  \parbox{#1\linewidth}{
    \center #3
  }
  \hfill
}

\def\@frontpages@trst@en@frontpage{
  \thispagestyle{empty}
  \noindent
  \hfuzz=3pt % ker se spodnja minipagea prekrivata
  % minipage je potreben, ker dva parboxa ne pašeta lepo
  \begin{minipage}[6em]{0.5\linewidth}
    \small\center
    UNIVERSITY OF TRIESTE\\[1mm]
    DEPARTIMENT OF MATHEMATICS\\
    AND GEOLOGY
  \end{minipage}
  \begin{minipage}[6em]{0.5\linewidth}
    \small\center
    UNIVERZA V LJUBLJANI\\[1mm]
    FAKULTETA ZA MATEMATIKO\\
    IN FIZIKO
  \end{minipage}\\
  \begin{center}
    \@programme\ -- \@cycle
  \end{center}
  \vfill

  \begin{center}{\large
  \@avtor\\[2mm]
  {\Large\textbf{\MakeUppercase{\@title}}}\\[10mm]
  \@thesistype\\[1cm]
  \begin{tabular}{rl} \@supervisors \end{tabular}
  }
  \end{center}
  \vfill

  \begin{center}\large
    Ljubljana, \@letnica
  \end{center}
  \cleardoublepage
}
\def\@frontpages@trst@itslo@frontpage{
  \thispagestyle{empty}
  \noindent
  \hfuzz=3pt % ker se spodnja minipagea prekrivata
  % minipage je potreben, ker dva parboxa ne pašeta lepo
  \begin{minipage}[6em]{0.5\linewidth}
    \small\center
    UNIVERSITÀ DEGLI STUDI DI TRIESTE\\[1mm]
    DIPARTIMENTO DI MATEMATICA\\
    E GEOSCIENZE\\[1mm]
    Programma di doppio titolo\\
    in Matematica
  \end{minipage}
  \begin{minipage}[6em]{0.5\linewidth}
    \small\center\vspace*{2.5pt} % poravnava zaradi `À` v drugi univerzi
    UNIVERZA V LJUBLJANI\\[1mm]
    FAKULTETA ZA MATEMATIKO\\
    IN FIZIKO\\[1mm]
    Program dvojne diplome\\
    iz matematike
  \end{minipage}
  \vfill
  \begin{center}
  {\large
  \@avtor\\[2mm]
  \dvastolpca
    {\Large\textbf{\MakeUppercase{\@it@title}}}
    {\Large\textbf{\MakeUppercase{\@naslov}}}
  \\[10mm]
  \dvastolpca
    {\large\@it@thesistype}
    {\large\@tipdela}
  \\[1cm]
  \begin{tabular}{rl} \@it@supervisors \\ \@mentorji \end{tabular}
  }
  \end{center}
  \vfill

  \begin{center}\large
    Ljubljana, \@letnica
  \end{center}
  \cleardoublepage
}
\def\@frontpages@sl@zahvala{
  \ifdefined\@zahvala
    \pdfbookmark[1]{Zahvala}{zahvala}
    \section*{Zahvala}
    \@zahvala
    \vfill
    \cleardoublepage
  \fi
}
\def\@frontpages@en@acknowledgements{
  \ifdefined\@zahvala
    \pdfbookmark[1]{Acknowledgements}{zahvala}
    \section*{Acknowledgements}
    \@zahvala
    \vfill
    \cleardoublepage
  \fi
}
\def\@frontpages@sl@povzetek{
  \begin{center}
    \textbf{\@naslov}\\[3mm]
    \textsc{Povzetek}
  \end{center}
  \@povzetek
  \vfill
}
\def\@frontpages@en@abstract{
  \begin{center}
    \textbf{\@title}\\[3mm]
    \textsc{Abstract}
  \end{center}
  \@abstract
  \vfill
}
\def\@frontpages@trst@abstract{
  \begin{otherlanguage}{italian}
  \begin{center}
    \textbf{\@it@title}\\[3mm]
    \textsc{Sommario}
  \end{center}
  \@it@abstract
  \end{otherlanguage}
  \vfill
}
\def\@frontpages@sl@kljucnebesede{
  \noindent
  \textbf{Math. Subj. Class. (2020):} \@klasifikacija \\[1mm]
  \def\sep{, } % Pri izpisu ključne besede ločimo z vejico.
  \textbf{Ključne besede:} \@kljucnebesede \\[1mm]
  \textbf{Keywords:} \@keywords
}
\def\@frontpages@en@keywords{
  \noindent
  \textbf{Math. Subj. Class. (2020):} \@klasifikacija \\[1mm]
  \def\sep{, } % Pri izpisu ključne besede ločimo z vejico.
  \textbf{Keywords:} \@keywords \\[1mm]
  \textbf{Ključne besede:} \@kljucnebesede
}
\def\@frontpages@trst@keywords{
  \noindent
  \textbf{Math. Subj. Class. (2020):} \@klasifikacija \\[1mm]
  \def\sep{, } % Pri izpisu ključne besede ločimo z vejico.
  \textbf{Keywords:} \@keywords \\[1mm]
  \textbf{Parole chiave:} \@it@keywords \\[1mm]
  \textbf{Ključne besede:} \@kljucnebesede
}

\AfterEndPreamble{%
% magisterije začnemo z rimskimi številkami
\@ifthen{\boolean{@drugastopnja}}{\pagenumbering{roman}}
\pagestyle{plain}
\@sloeng{\bibliographystyle{fmf-sl}}{\bibliographystyle{fmf-en}}
\@frontpages

% vsebino magisterije začnemo z arabskimi številkami od 1 naprej
\@ifthen{\boolean{@drugastopnja}}{
  \setcounter{page}{1}
  \pagenumbering{arabic}
}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IZPIS KONČNIH STRANI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\@make@razsirjenipovzetek}[3]{
  % Args: jezik, naslov razš. povzetka (v jeziku), ime datoteke povzetka
  % V razširjenem povzetku želimo, da razdelki pripadajo nekemu
  % nad-razdelku "Razširjeni povzetek", zato vse razdelke premaknemo
  % en nivo nižje in nastavimo številčenje na podrazdelek.

  % shrani stare definicije razdelkov
  \let\oldthesection\thesection
  \let\oldthesubsection\thesubsection
  \let\oldsection\section
  \let\oldsubsection\subsection

  % nastavi številčenje po podrazdelkih
  \def\thesection{}
  \def\thesubsection{\@arabic\c@subsection}
  \numberwithin{equation}{subsection}

  % premakne nivoje razdelkov en nivo nižje, da nivo `\section' spada pod razdelek razširjenega povzetka
  \let\section\subsection
  \let\subsection\subsubsection

  \cleardoublepage
  \begin{otherlanguage}{#1}
    \phantomsection % potrebno za pravilno številčenje strani v kazalih
    \addcontentsline{toc}{section}{#2} % doda razdelek v kazalo in metapodatke
    \begin{center}
      \textsc{#2}
    \end{center}
    \input{#3}
  \end{otherlanguage}

  % obnovi stare definicije razdelkov
  \let\thesection\oldthesection
  \let\thesubsection\oldthesubsection
  \let\section\oldsection
  \let\subsection\oldsubsection
}


\AtEndDocument{%
\ifdefined\@slovar
\pdfbookmark[1]{Slovar strokovnih izrazov}{slovar}
\section*{Slovar strokovnih izrazov}
\@slovar
\fi
\ifdefined\@literatura
\cleardoublepage
\phantomsection
\@sloeng
  {\addcontentsline{toc}{section}{Literatura}}
  {\addcontentsline{toc}{section}{References}}
\bibliography{\@literatura}
\fi
\cleardoublepage
\printindex

\@ifthen{\boolean{@trst}}{
  \newtheorem{assioma}{Assioma}
  \newtheorem{definizione}{Definizione}[subsection]
  \newtheorem{osservazione}[definition]{Osservazione}
  \newtheorem{esempio*}[definition]{Esempio}
  \newenvironment{esempio}[1][]{
    \begin{esempio*}[#1]\renewcommand*{\qedsymbol}{$\diamondsuit$}\pushQED{\qed}
  }{
    \popQED\end{esempio*}
  }

  \@make@razsirjenipovzetek{italian}{Sintesi estesa}{\@it@razsirjenipovzetek}
}
\@ifthen{\boolean{@anglescina}}{
  % spremeni številčenje definicij, izrekov, ipd. na ustrezen nivo
  \let\definicija\undefined
  \let\c@definicija\undefined
  \theoremstyle{definition}
  \newtheorem{definicija}{Definicija}[subsection]

  \@make@razsirjenipovzetek{slovene}{Razsirjeni povzetek}{\@razsirjenipovzetek}
}
}
