\newcommand{\sectionbreak}{\clearpage}
\renewcommand{\labelitemi}{$\bullet$}
\renewcommand{\labelitemii}{$\circ$}
\renewcommand{\labelitemiii}{$-$}
\renewcommand{\contentsname}{Sommaire}
\renewcommand{\chaptername}{Partie}
\setcounter{secnumdepth}{5}
\setcounter{tocdepth}{5}
\pagestyle{fancy}
\renewcommand{\sectionmark}{\markboth{\thesection}}
\fancyhead{}
\fancyfoot{}
\fancyhead[L]{\UPLEFT{}}
\fancyhead[R]{Partie \leftmark}
\fancyfoot[C]{Page \thepage}
\fancyfoot[L]{\BOTTOMLEFT{}}
\fancyfoot[R]{\BOTTOMRIGHT{}}
\maketitle
\thispagestyle{empty}
\newpage
\cleardoublepage
\pagenumbering{gobble}
\tableofcontents
\thispagestyle{empty}
\cleardoublepage
\pagenumbering{arabic}
\newpage
