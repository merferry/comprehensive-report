%
% v1.1:  Changed margins slightly
%
% v1.2:  Moved page number to center of footer for \ps@plain, added
%        \ps@center and \ps@side
%
% v1.3:  Minor changes for pdflatex
%        Page styles added for page numbers for NSF proposals
%

\def\filename{proposal}
\def\fileversion{v1.3}
\def\filedate{2000/07/07}

% \acknowledge
% \maketitle
% \begin{abstract} .. \end{abstract}

\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{proposal}[\filedate\space\fileversion\space
Postscript Fonts]%
\typeout{*** Proposal \fileversion\space <\filedate> (jef) ***}
\RequirePackage{float}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions%

%  Base everything on the default class 'article'.
\LoadClass{article}%


\newif\if@noabstract\@noabstracttrue  % Does the paper have an
                                      %  abstract defined?

% jef 07-jul-2000
\setlength\paperheight {11in}%
\setlength\paperwidth  {8.5in}
\usepackage{figures-epspdf}

\newcommand{\totimes}[4]{\fontsize{#3}{#4}\usefont{OT1}{phv}{#1}{#2}}

% \newcommand{\titlefont}    {\totimes{b}{n}{18}{22pt}}
\newcommand{\titlefont}    {\totimes{b}{n}{14}{22pt}}
% \newcommand{\partfont}     {\totimes{b}{n}{18}{20pt}}
% \newcommand{\partnamefont} {\totimes{b}{n}{18}{20pt}}
\newcommand{\partfont}     {\totimes{b}{n}{14}{20pt}}
\newcommand{\partnamefont} {\totimes{b}{n}{14}{20pt}}
\newcommand{\sectionfont}  {\totimes{b}{n}{12}{13pt}}
\newcommand{\subsectionfont}  {\totimes{b}{it}{11}{13pt}}
\newcommand{\correspondingfont} {\totimes{m}{sl}{11}{13pt}}
\newcommand{\mynormalsize} {\totimes{m}{sl}{11}{11pt}}
\newcommand{\datefont} {\totimes{m}{sl}{11}{13pt}}
% \newcommand{\authorfont} {\totimes{b}{n}{12}{14pt}}
\newcommand{\authorfont} {\totimes{b}{n}{11}{14pt}}
% \newcommand{\addressfont} {\totimes{m}{sl}{12}{14pt}}
\newcommand{\addressfont} {\totimes{m}{sl}{11}{14pt}}

% \setlength\oddsidemargin {0.125in}
% \setlength\evensidemargin {0.125in}
% \setlength\textwidth      {6.25in}
\setlength\oddsidemargin {0pt}
\setlength\evensidemargin {0pt}
\setlength\textwidth      {6.5in}

\setlength\topmargin      {-36pt}  % 1/2 inch
\setlength\headheight     {31pt}   % header takes up most
\setlength\headsep        {4pt}    % so text begins at 1in margin

\setlength\marginparwidth {0.75in}  % too w/in 1/4 of the edge of the page
\setlength\marginparsep   {9pt}     % 1/8 inch between text and marginpar
\setlength\marginparpush  {5pt}     % Width between margin paragraphs

% \setlength\textheight     {8.875in}
\setlength\textheight     {9in}
\setlength\footskip       {21pt}

\setlength\parskip   {0pt plus 1pt}
\setlength\parindent {17pt}

\renewcommand{\thepart}          {\Roman{part}}

\renewcommand{\thesubsection}    {\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection} {\thesubsection.\arabic{subsubsection}}
\renewcommand{\theparagraph}     {\thesubsubsection.\arabic{paragraph}}
\renewcommand{\thesubparagraph}  {\theparagraph.\arabic{subparagraph}}

\@addtoreset{section}{part}  % Section counter resets at each part


\renewcommand\part{\par
   \addvspace{4ex}%
   \@afterindentfalse
   \secdef\@mypart\@myspart}

\renewcommand\section{
%       \if@titlepg
%        \if@noabstract\vfill\clearpage\thispagestyle{plain}
%        \fi
%        \global\@noabstractfalse\fi
        \par\addvspace{3.0ex plus 1ex minus .2ex} \@afterindentfalse 
        \secdef\@mySection\@mySSection
}

\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
%                                      {-3.25ex\@plus 1ex \@minus .2ex}%
%                                      {1.5ex \@plus .2ex}%
                                     {2ex}%
                                     {0.5ex}%
                                     {\reset@font\subsectionfont}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
%                                      {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {-1.5ex}%
%                                      {1.5ex \@plus .2ex}%
                                     {0.5ex}%
                                     {\reset@font\normalsize\itshape\bfseries}}
\renewcommand{\paragraph}{\@startsection{paragraph}{4}{\noindent}%
                                    {-3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\reset@font\mynormalsize}}
\renewcommand{\subparagraph}{\@startsection{subparagraph}{5}{\noindent}%
                                       {-3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\reset@font\mynormalsize}}


\def\@mypart[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \partnamefont
     \ifnum \c@secnumdepth >\m@ne
       \partname~\thepart---%
%        \par\nobreak
     \fi
     \partfont #2\,\hrulefill%
     \markboth{}{}\par}%
    \nobreak
    \vskip 3ex
    \@afterheading}
\def\@myspart#1{%
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \partfont
     #1\,\hrulefill\par}%
     \nobreak
     \vskip 3ex
     \@afterheading}

\def\@mySection[#1]#2{
  \ifnum \c@secnumdepth > \z@ 
    \refstepcounter{section}
    \addcontentsline{toc}{section}{\hbox to
                                   0.3in{\hss\thesection}. \hspace{0.5em}#1}
    %{\noindent\sectionfont\thesection .\hskip 1em #2\,\hrulefill\par}
    {\noindent\sectionfont\thesection .\hskip 1em #2\,\par}
  \else
    \addcontentsline{toc}{section}{#1}
    {\noindent\reset@font\sectionfont #2 \par}
  \fi
%   \par \nobreak \vskip 2.3ex plus .2ex \@afterheading 
  \par \nobreak \vskip 0.5ex \@afterheading 
}

\def\@mySSection#1{{\noindent\reset@font\sectionfont #1\,\hrulefill}%
         \par\nobreak\vskip 2.3ex plus .2ex \@afterheading \@afterindentfalse}

\def\@myAppendix[#1]#2{
  \ifnum \c@secnumdepth > \z@ 
    \refstepcounter{section}
    \addcontentsline{toc}{section}{\hbox to
                                   0.3in{\hss\thesection}. \hspace{0.5em}#1}
    {\noindent\sectionfont \appendixname\  \thesection :\hskip 1em #2\,%
			           \hrulefill\par}
  \else
    \addcontentsline{toc}{section}{#1}
    {\noindent\reset@font\sectionfont \appendixname\  #2 \par}
  \fi
  \par \nobreak \vskip 2.3ex plus .2ex \@afterheading }

\renewcommand{\appendix}{\par%
  \setcounter{section}{0}
  \setcounter{subsection}{0}
  \def\thesection{\Alph{section}}
  \renewcommand{\section}{
        \par\addvspace{3.0ex plus 1ex minus .2ex} \@afterindentfalse 
        \secdef\@myAppendix\@mySSection }
}
\def\@appear{}
\def\@citeref{}
\def\@author{}\def\author#1{\global\def\@author{#1}}
\def\@address{}\def\address#1{\global\def\@address{#1}}
\def\@title{}\def\title#1{\global\def\@title{#1}}
\def\@corresponding{}\def\corresponding#1{\global\def\@corresponding{#1}}
\def\@date{\today}\def\date#1{\global\def\@date{#1}}
\def\@citeref{}
\def\citeref#1{\global\def\@citeref{\small\it #1}}
\def\@appeartext{}
\def\@appear{\parbox[t]{5in}{\@appeartext}\hfill\@citeref}
\def\appear#1{\global\def\@appeartext{#1}}

\if@titlepage
    \renewcommand{\maketitle}{%
	\renewcommand{\thefootnote}{\fnsymbol{footnote}}%
	\setcounter{footnote}{1}
	\renewcommand{\thefootnote}{\fnsymbol{footnote}}%
        \def\@makefnmark{\hbox to\z@{$\m@th^{\@thefnmark}$\hss}}%
        \long\def\@makefntext##1{\parindent 1em\noindent
           \hbox to1.8em{\hss$\m@th^{\@thefnmark}$}##1}%
	{ \setcounter{page}{0}\center{
	  \thispagestyle{location}%
	  \par\noindent\vfill\titlefont\def\baselinestretch{1.5}%
	  \@title\par}\vskip 4em
	\par\noindent\authorfont\@author\vskip 1.6em
	\par\noindent\addressfont\@address\vskip 3.5em
	\par\noindent\datefont\@date\vskip 3em
	\par\noindent\correspondingfont\@corresponding\vskip 2em}
	\let\maketitle\relax\let\maketitlepage\relax% allow the command only once
	\setcounter{footnote}{0}
	\global\@noabstracttrue%
	\vfill\@thanks\newpage}
\else
  \renewcommand{\maketitle}
     {{ \renewcommand{\thefootnote}{\fnsymbol{footnote}}%
	\def\@makefnmark{\hbox to\z@{$\m@th^{\@thefnmark}$\hss}}%
        \long\def\@makefntext##1{\parindent 1em\noindent
           \hbox to1.8em{\hss$\m@th^{\@thefnmark}$}##1}%
	{\par\baselineskip 42pt
% 	\vspace*{1.0em}
	\setcounter{footnote}{1}
	\renewcommand{\thefootnote}{\fnsymbol{footnote}}%
        \thispagestyle{location}%
	\par\noindent\titlefont\def\baselinestretch{1.5}%
	\@title\normalsize\vskip 0.8em
	\par\noindent\authorfont\@author\vskip 1.2em
	\par\noindent}{\addressfont\@address\par\vskip 1.2em}
	\par\noindent\correspondingfont\@corresponding\vskip 1.6em
	\global\@noabstractfalse
	\setcounter{footnote}{0}
	\@thanks\let\maketitle\relax\let\maketitlepage\relax}}
\fi

\newcommand\acknowledge[1]{\section*{Acknowledgments} {#1}}

\renewenvironment{abstract}
  {\global\@noabstractfalse\section*{Abstract}
      \small\if@titlepage\small\fi}
  {\if@twocolumn\else\relax\fi\if@titlepage\vfill
      \normalsize\clearpage\fi}

\def\ps@location{\let\@mkboth\@gobbletwo
     \def\@oddhead{\@appear}\def\@oddfoot{}
     \let\@evenhead\@oddhead\let\@evenfoot\@oddfoot}

\def\ps@plain{\let\@mkboth\@gobbletwo
     \def\@oddhead{}\def\@oddfoot{{\hfil\it\thepage\hfil}}
     \let\@evenhead\@oddhead\let\@evenfoot\@oddfoot}

\let\ps@center\ps@plain

\def\ps@side{\let\@mkboth\@gobbletwo
     \def\@oddhead{}\def\@oddfoot{{\hfil\it\thepage}}
     \let\@evenhead\@oddhead\let\@evenfoot\@oddfoot}

\def\ps@ProjectSummary{\let\@mkboth\@gobbletwo
     \def\@oddhead{}\def\@oddfoot{{\hfil\it{A{\thepage}}\hfil}}
     \let\@evenhead\@oddhead\let\@evenfoot\@oddfoot}

\def\ps@ProjectDescription{\let\@mkboth\@gobbletwo
     \def\@oddhead{}\def\@oddfoot{{\hfil\it{C{\thepage}}\hfil}}
     \let\@evenhead\@oddhead\let\@evenfoot\@oddfoot}

\def\ps@References{\let\@mkboth\@gobbletwo
     \def\@oddhead{}\def\@oddfoot{{\hfil\it{D{\thepage}}\hfil}}
     \let\@evenhead\@oddhead\let\@evenfoot\@oddfoot}

\def\ps@BiographicalSketches{\let\@mkboth\@gobbletwo
     \def\@oddhead{}\def\@oddfoot{{\hfil\it{E{\thepage}}\hfil}}
     \let\@evenhead\@oddhead\let\@evenfoot\@oddfoot}

\def\ps@BudgetJustification{\let\@mkboth\@gobbletwo
     \def\@oddhead{}\def\@oddfoot{{\hfil\it{F{\thepage}}\hfil}}
     \let\@evenhead\@oddhead\let\@evenfoot\@oddfoot}

\def\ps@SupplementaryDocumentation{\let\@mkboth\@gobbletwo
     \def\@oddhead{}\def\@oddfoot{{\hfil\it{I{\thepage}}\hfil}}
     \let\@evenhead\@oddhead\let\@evenfoot\@oddfoot}


% Figure changes...

% change default positioning and caption header
\def\fps@figure{htbp}
\def\fps@table{htb}
\def\fnum@figure{{\bf\figurename~\thefigure:}}
\def\fnum@table{{\bf\tablename~\thetable:}}

% Using package float...
%  o Want figures to have lines, captions at bottom.
%  o Want tables to have lines, captions at top.
%
\newcommand\fs@myfigruled{\def\@fs@cfont{\bfseries}\let\@fs@capt\floatc@ruled
  \def\@fs@pre{\kern4pt\hrule\kern4pt}
  \def\@fs@post{}%\kern2pt\hrule\relax}%
  \def\@fs@mid{\kern4pt\hrule\kern4pt}%
  \let\@fs@iftopcapt\iffalse}  % Changed to place caption at bottom

\newcommand\fs@mytableruled{\def\@fs@cfont{\bfseries}\let\@fs@capt\floatc@ruled
  \def\@fs@pre{}%\hrule height.8pt depth0pt \kern2pt}%
  \def\@fs@post{\kern4pt\hrule\relax}%
  \def\@fs@mid{\kern4pt\hrule\kern10pt}%
  \let\@fs@iftopcapt\iftrue}

%%\floatstyle{myfigruled}
%%\restylefloat{figure}
%\floatstyle{mytableruled}
%\restylefloat{table}
\pagestyle{plain}

\endinput

