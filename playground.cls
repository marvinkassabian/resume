\LoadClass{article}

\ProvidesClass{playground}[2020/03/07 playground class]

\RequirePackage{titlesec}
\RequirePackage{bold-extra}
\RequirePackage{geometry}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{fontspec}
\RequirePackage[english]{babel}


\setmainfont{TEX Gyre Schola}[
	SmallCapsFont={TEX Gyre Termes},
	SmallCapsFeatures={Letters=SmallCaps},
]
\titlespacing*{\section}
{0pt}{0pt}{0pt}
\titlespacing*{\subsection}
{0pt}{0pt}{0pt}

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

\titleformat{\section} % Customise the \section command 
	{
		\Large % Make the \section headers large,
		\scshape % small capitals
		\raggedright % and left aligned
		\bfseries		
	}
	{}{0em} % Can be used to give a prefix to all sections, like 'Section ...'
	{} % Can be used to insert code before the heading
	[\titlerule] % Inserts a horizontal line after the heading
  
\titleformat{\subsection}
	{
		\raggedright
	}
	{}{0em}
	{}

\newcommand{\subsectionlocationdate}[3]{%
	\subsection[#1]{\textbf{#1} • #2 \hfill (#3)}%
}

\newcommand{\subsectiondate}[2]{%
	\subsection[#1]{\textbf{#1} \hfill (#2)}%
}

\newcommand{\subsectionpositiondate}[3]{%
	\subsection[#1]{\textbf{#1} - \textit{\textbf{#2}} \hfill (#3)}%
}

\newcommand{\resumesublistbegin}{
	\begin{itemize}[topsep=0pt, partopsep=0pt, itemsep=0pt, parsep=0pt]
}

\newcommand{\resumesublistend}{
	\end{itemize}
}