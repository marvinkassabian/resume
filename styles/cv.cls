\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{../styles/cv}[2023/12/15 CV class]

\LoadClass{../styles/base}

% More spacious A4 paper layout
\DeclareOption{A4}{
    \geometry{
        a4paper,
        top=25mm,
        bottom=25mm,
        outer=25mm,
        inner=25mm,
        footskip=15mm,
        headsep=15mm,
        marginparwidth=0pt,
        marginparsep=0pt
    }
}

% More generous spacing for sections
\titlespacing*{\section}{0pt}{12pt plus 4pt minus 4pt}{8pt plus 2pt minus 2pt}
\titlespacing*{\subsection}{0pt}{8pt plus 2pt minus 2pt}{4pt plus 1pt minus 1pt}

% Enable page numbers
\pagenumbering{arabic}

% Less aggressive ragged settings
\raggedbottom
\raggedright

% More spacious itemize environment for CV
\renewcommand{\resumesublistbegin}{%
    \begin{itemize}[label=\seperator, 
                   topsep=4pt, 
                   partopsep=0pt, 
                   itemsep=2pt, 
                   parsep=2pt]
}

% Additional CV-specific commands
\newcommand{\cvsection}[1]{
    \pagebreak[2] % Encourage page breaks after sections
    \section{#1}
}

\newcommand{\cvsubsection}[1]{
    \vspace{4pt}
    \subsection{#1}
}

% Execute A4 by default for CV
\ExecuteOptions{A4}
\ProcessOptions