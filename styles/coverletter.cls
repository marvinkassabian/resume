\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{../styles/coverletter}[2020/03/07 coverletter class]

\LoadClass{base}

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

\ExecuteOptions{A5}
\ProcessOptions
\pagenumbering{gobble}
\raggedbottom
\raggedright