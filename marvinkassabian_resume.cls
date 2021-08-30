\LoadClass{article}

\ProvidesClass{marvinkassabian_resume}[2020/03/07 resume class]

\RequirePackage{titlesec}
\usepackage[T1]{fontenc}
\usepackage{tgschola}
\RequirePackage{bold-extra}
\RequirePackage{geometry}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{fontspec}
\RequirePackage[english]{babel}
\RequirePackage{changepage}


\setmainfont{TEX Gyre Schola}[
	SmallCapsFont={TEX Gyre Termes},
	SmallCapsFeatures={Letters=SmallCaps},
]

\titlespacing*{\section}{0pt}{0pt}{3pt}

\titlespacing*{\subsection}{0pt}{0pt}{0pt}

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

\newcommand{\seperator}{
	•
}
	
\newcommand{\timeformat}[1]{
	\textit{#1}
}

\newcommand{\subsectionlocationdate}[3]{
	\subsection[#1]{\textbf{#1} \seperator #2\hfill\timeformat{#3}}
}

\newcommand{\subsectiondegreelocationdate}[4]{
	\subsection[#1]{\textbf{#1} \seperator #2\seperator #3\hfill\timeformat{#4}}
}

\newcommand{\subsectiondate}[2]{
	\subsection[#1]{\textbf{#1}\hfill\timeformat{#2}}
}

\newcommand{\subsectionpositiondate}[3]{
	\subsection[#1]{\textbf{#1} \seperator \textit{\textbf{#2}}\hfill\timeformat{#3}}
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

\newcommand{\resumeheadersimple}[1]{
	\hfill{\Large{\textbf{\scshape{#1}}}}\hfill
}

\newcommand{\educationextra}[4]{
	\begin{adjustwidth}{1em}{0pt}
		{#1 \seperator #2}

		{#3 \seperator #4}
	\end{adjustwidth}
}

\newcommand{\cpp}{
	C\texttt{++}
}