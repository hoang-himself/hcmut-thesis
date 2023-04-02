\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hcmut-thesis}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass[12pt,a4paper]{memoir}

\RequirePackage[utf8]{vntex,inputenc}
\RequirePackage{anyfontsize,mathptmx}
\RequirePackage[T5]{fontenc}

\RequirePackage{geometry,graphicx,indentfirst,setspace}
\RequirePackage{tikz}

\RequirePackage{fancyhdr,hyperref}
\RequirePackage[super,square,sort]{natbib}
\RequirePackage[nameinlink]{cleveref} % use \Cref{} instead of \ref{}

% Change to [english,vietnamese] to use Vietnamese labels
\RequirePackage[english]{babel}

\usetikzlibrary{calc}

% Draft watermark
% https://github.com/callegar/LaTeX-draftwatermark

%\graphicspath{{subdir1/}{subdir2/}{subdir3/}...{subdirn/}}

% Custom commands
\newcommand{\Month}{
  \ifcase \the\month
  \or January
  \or February
  \or March
  \or April
  \or May
  \or June
  \or July
  \or August
  \or September
  \or October
  \or November
  \or December
  \fi
}

\newcommand{\@deptname}{Faculty of Computer Science and Engineering}
\newcommand{\odeptname}[1]{\renewcommand{\@deptname}{#1}}

\newcommand{\@reporttype}{Graduation Thesis}
\newcommand{\oreporttype}[1]{\renewcommand{\@reporttype}{#1}}

\newcommand{\@stumajor}{Computer Science}
\newcommand{\ostumajor}[1]{\renewcommand{\@stumajor}{#1}}

\renewcommand{\@title}{Report title}
\newcommand{\otitle}[1]{\renewcommand{\@title}{#1}}

\newcommand{\@defcouncil}{Council}
\newcommand{\odefcouncil}[1]{\renewcommand{\@defcouncil}{#1}}

\newcommand{\@supervisor}{Supervisor}
\newcommand{\osupervisor}[1]{\renewcommand{\@supervisor}{#1}}

\newcommand{\@secretary}{Secretary}
\newcommand{\osecretary}[1]{\renewcommand{\@secretary}{#1}}

\newcommand{\@stuname}{STUDENT 1: Name (ID)\\STUDENT 2: Name (ID)}
\newcommand{\ostuname}[1]{\renewcommand{\@stuname}{#1}}

\newcommand{\@reportplace}{Ho Chi Minh City}
\newcommand{\oreportplace}[1]{\renewcommand{\@reportplace}{#1}}

\newcommand{\@reporttime}{\Month \the\year}
\newcommand{\oreporttime}[1]{\renewcommand{\@reporttime}{#1}}

% Configurations
\geometry{
  paper=a4paper,
  left=3cm,
  right=2cm,
  vmargin=2cm,
  includeheadfoot=true,
  headheight=30pt
}

\renewcommand{\large}{\fontsize{15}{15}\selectfont}
\renewcommand{\Large}{\fontsize{20}{20}\selectfont}

\OnehalfSpacing%
\raggedbottom

% Allow page breaks inside align* environment
%\allowdisplaybreaks{}

% Makes a lot of things blue, avoid at all costs
%\everymath{\color{blue}}

% Set depth of numbering for sections and table of contents
%\setsecnumdepth{section}
%\setcounter{tocdepth}{1}

\AtBeginDocument{\renewcommand*\bibname{References}}

\hypersetup{
  colorlinks=true,
  linkcolor=black,
  citecolor=red,
  urlcolor=blue
}

\pagestyle{fancy}

\renewcommand{\headrulewidth}{0.3pt}
\fancyhead{}
\fancyhead[EL,OR]{\bfseries \nouppercase{\rightmark}}

\renewcommand{\footrulewidth}{0pt}
\fancyfoot{}{}
\fancyfoot[C]{\thepage}

% Custom pages and sections
\def\coverpage{
  \thispagestyle{empty}
  %\setlength{\oddsidemargin}{0cm}
  %\addtolength{\voffset}{-2.5cm}
  %\addtolength{\textwidth}{-2cm}

  \begin{tikzpicture}[remember picture,overlay]
    \draw[line width=3pt](
    $(current page.north west) + (3.0cm,-2.0cm)$
    ) rectangle (
    $(current page.south east) + (-2.0cm,2.0cm)$
    );
    \draw[line width=1pt](
    $(current page.north west) + (2.9cm,-1.9cm)$
    ) rectangle (
    $(current page.south east) + (-1.9cm,1.9cm)$
    );
  \end{tikzpicture}

  \vspace*{-3\baselineskip}
  \begin{center}
    \large \bfseries
    VIET NAM NATIONAL UNIVERSITY HO CHI MINH CITY

    HO CHI MINH CITY UNIVERSITY OF TECHNOLOGY

    \MakeUppercase{\@deptname}
    \\[2\baselineskip]
    \includegraphics[scale=0.4]{graphics/hcmut.png}
    \\[2\baselineskip]
    \MakeUppercase{\@reporttype}
    \\[3\baselineskip]
    {\Large \MakeUppercase{\parbox[c]{0.8\linewidth}{\centering \@title}}}
    \\[1\baselineskip]
    {\mdseries Major: \@stumajor}
  \end{center}

  \vfill%
  {
    \large \bfseries
    \hfill \parbox[t]{12cm}{
      THESIS COMMITTEE: \@defcouncil

      SUPERVISOR(s): \parbox[t]{7cm}{\@supervisor}

      SECRETARY: \@secretary

      \hspace*{3cm} ---o0o---

      \@stuname
    }
  }

  \vspace{2\baselineskip}
  \begin{center}
    \large
    \MakeUppercase{\@reportplace, \@reporttime}
  \end{center}

  \clearpage
}

\providecommand{\phantomsection}{}
\newenvironment{preface}[1]{
  \vspace*{\stretch{2}}
  {\noindent \bfseries \Huge #1}
  \begin{center}
    \thispagestyle{plain}
    \phantomsection\addcontentsline{toc}{chapter}{#1}
  \end{center}
}{
  \vspace*{\stretch{5}}
}
