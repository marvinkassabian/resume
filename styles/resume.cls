\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{../styles/resume}[2020/03/07 resume class]

\LoadClass{../styles/base}

\DeclareOption{A5}{
    \geometry{
        paperheight = 279mm,
        paperwidth = 216mm,
        top = 20pt,
        bottom = 20pt,
        outer = 80pt,
        inner = 80pt,
        footskip = 30pt,
        headsep = 30pt,
        headheight = 30pt,
    }
}

% Use a larger right margin to keep resume lines tighter and improve vertical fill.
\renewcommand{\resumesublistbegin}{
    \begin{itemize}[label=\seperator, topsep=0pt, partopsep=0pt, itemsep=0pt, parsep=0pt, rightmargin=2em]
}

\ExecuteOptions{A5}
\ProcessOptions
\pagenumbering{gobble}
\raggedbottom
\raggedright