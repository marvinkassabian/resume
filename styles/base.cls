\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{../styles/base}[2020/03/07 base document class]

\LoadClass{article}

\RequirePackage{titlesec}
\usepackage[T1]{fontenc}
\RequirePackage{mathpazo}
\RequirePackage{bold-extra}
\RequirePackage{geometry}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage[english]{babel}
\RequirePackage{changepage}
\RequirePackage{hyperref}

% Enable hyperref with better colors for CV
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    urlcolor=blue,
    citecolor=blue,
    filecolor=blue,
    pdftitle={CV},
    pdfauthor={},
    pdfsubject={},
    pdfkeywords={}
}

% Common title formatting
\titleformat{\section}
{
    \Large
    \scshape
    \raggedright
    \bfseries
}
{}{0em}
{}
[\titlerule]

\titleformat{\subsection}
{
    \raggedright
}
{}{0em}
{}

% Common spacing
\titlespacing*{\section}{0pt}{0pt}{3pt}
\titlespacing*{\subsection}{0pt}{0pt}{0pt}

% Common commands
\newcommand{\seperator}{
    •
}

\newcommand{\titleseperator}{
    $\mid$
}

\newcommand{\timeformat}[1]{
    \textit{#1}
}

\newcommand{\subsectionlocationdate}[3]{
    \subsection[#1]{\textbf{#1}\seperator #2\hfill\timeformat{#3}}
}

\newcommand{\subsectiondegreelocationdate}[4]{
    \subsection[#1]{\textbf{#1}\seperator #2\seperator #3\hfill\timeformat{#4}}
}

\newcommand{\subsectiondate}[2]{
    \subsection[#1]{\textbf{#1}\hfill\timeformat{#2}}
}

\newcommand{\subsectionpositiondate}[3]{
    \subsection[#1]{\textbf{#1}\seperator \textit{\textbf{#2}}\hfill\timeformat{#3}}
}

\newcommand{\resumesublistbegin}{
    \begin{itemize}[label=\seperator, topsep=0pt, partopsep=0pt, itemsep=0pt, parsep=0pt]
}

\newcommand{\resumesublistend}{
    \end{itemize}
}

\newcommand{\resumeheader}[7]{
    {#1}\hfill{#5}

    {#2}\hfill{\Large{\textbf{\scshape{#4}}}}\hfill{#6}

    {#3}\hfill{#7}
}

\newcommand{\resumeheadersimple}[3]{
    \begin{center}
        {\Large{\textbf{\scshape{#1}}}}

        {#2}

        {#3}
    \end{center}
}

\newcommand{\resumeheadersimpler}[4]{
    \begin{center}
        {\Large{\textbf{\scshape{#1}}}}
        
        {\href{mailto:#2}{#2}\seperator \href{tel:#3}{#3}\seperator #4}
    \end{center}
}

\newcommand{\header}[4]{
    \begin{center}
        {\Large{\textbf{\scshape{#1}}}}

        {#2}

        {#3}

        {#4}
    \end{center}
}

\newcommand{\educationextra}[4]{
    \begin{adjustwidth}{1em}{0pt}
        {#1\seperator #2}

        {#3\seperator #4}
    \end{adjustwidth}
}

\newcommand{\cpp}{
    C\texttt{++}
}