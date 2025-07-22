\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{../styles/resume}[2020/03/07 resume class]

\LoadClass{../styles/base}

\DeclareOption{A5}{
    \geometry{
        paperheight = 279mm,
        paperwidth = 216mm,
        top = 20pt,
        bottom = 20pt,
        outer = 30pt,
        inner = 30pt,
        footskip = 30pt,
        headsep = 30pt,
        headheight = 30pt,
    }
}

\ExecuteOptions{A5}
\ProcessOptions
\pagenumbering{gobble}
\raggedbottom
\raggedright