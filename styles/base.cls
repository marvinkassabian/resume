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
    filecolor=blue
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
    \begin{itemize}[label=\seperator, topsep=0pt, partopsep=0pt, itemsep=0pt, parsep=0pt, rightmargin=2em]
}

\newcommand{\resumesublistend}{
    \end{itemize}
}

\newcommand{\resumeheader}[7]{
    \noindent
    \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
        #1 & \href{mailto:#5}{#5} \\  % Address line 1 left, email right
    \end{tabular*}
    
    \noindent
    \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}c@{\extracolsep{\fill}}r@{}}
        #2 & \smash{\raisebox{0pt}[\height][0pt]{\Large\textbf{\textsc{#4}}}} & \href{https://#6}{#6} \\  % Address line 2 left, title center, website right
    \end{tabular*}
    
    \noindent
    \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
        \href{tel:#3}{#3} & \href{https://#7}{#7} \\  % Phone left, second website right
    \end{tabular*}
    \vspace{0.5em}
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

\newcommand{\populatedtitlelafayette}{
    \resumeheader
        {2026 Lafayette Ave NE}
        {Grand Rapids, MI 49505}
        {+1 (616) 916-5415}
        {Marvin Kassabian}
        {marvin.kassabian@gmail.com}
        {github.com/marvinkassabian}
        {linkedin.com/in/marvinkassabian}
}

\newcommand{\populatedtitle}{\populatedtitlelafayette}

\newcommand{\populatedtitlechapin}{
    \resumeheader
        {1103 Chapin Ave}
        {Birmingham, MI 48009}
        {+1 (616) 916-5415}
        {Marvin Kassabian}
        {marvin.kassabian@gmail.com}
        {github.com/marvinkassabian}
        {linkedin.com/in/marvinkassabian}
}