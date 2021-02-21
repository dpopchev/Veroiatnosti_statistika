---
# title page setup
title:  'Presentation title'
subtitle: 'optional supplementary subtitle'
author:
- 'Author One'
- 'Author Two'
institute:
- 'Author One affiliation'
- 'Author Two affiliation'
#logo: image.png
#titlegraphic: somegraphic.png
date:

# theme
theme: Dresden
#theme: Bergen
colortheme: default
fonttheme: default
# see \useinnertheme and \useoutertheme
innertheme: default
outertheme: tree

# other beamer options
aspectratio: 43
beamerarticle: false
section-titles: false
fontsize: 9pt

# create table of content
toc: true

# one of the many metadata variables
keywords: [kw1, kw2]
abstract: |
    Note that YAML escaping rules must be followed. Thus, for example, if a title
    contains a colon, it must be quoted. The pipe character (|) can be used to begin
    an indented block that will be interpreted literally, without need for escaping.

# latex goodies
header-includes:
- \usepackage{tikz}
- \usetikzlibrary{positioning}
- \usetikzlibrary{arrows}
- \usepackage{DejaVuSans}
- |
    \definecolor{codegreen}{rgb}{0,0.6,0}
    \definecolor{codegray}{rgb}{0.5,0.5,0.5}
    \definecolor{codepurple}{rgb}{0.58,0,0.82}
    \definecolor{backcolour}{rgb}{0.95,0.95,0.92}
    \lstdefinestyle{mystyle}{
        basicstyle=\ttfamily\footnotesize,
        columns=fullflexible,
        fontadjust=true,
        backgroundcolor=\color{backcolour},
        commentstyle=\color{codegreen},
        keywordstyle=\color{magenta},
        numberstyle=\tiny\color{codegray},
        stringstyle=\color{codepurple},
        breakatwhitespace=false,
        breaklines=true,
        captionpos=b,
        keepspaces=true,
        numbers=left,
        numbersep=5pt,
        showspaces=false,
        showstringspaces=false,
        showtabs=false,
        tabsize=2
    }
    \lstset{style=mystyle}
- |
    \AtBeginSection{
    \stepcounter{subsection}
    \begin{frame}
        \tableofcontents[currentsection,
                         currentsubsection,
                         hideothersubsections,
                         sectionstyle=show/shaded
                        ]
    \end{frame}
    }
- |
    \AtBeginSubsection{
    \begin{frame}
        \begin{columns}[t]
          \begin{column}{5cm}
          \tableofcontents[sections={1-2},
                           currentsection,
                           currentsubsection,
                           subsectionstyle=show/shaded/hide
                           ]
          \end{column}
          \begin{column}{5cm}
          \tableofcontents[sections={3},
                           currentsection,
                           currentsubsection,
                           subsectionstyle=show/shaded/hide
                           ]
          \end{column}
          \end{columns}
    \end{frame}
    }
...

# Introduction

### \LaTeX vs Markdown

::: columns

:::: column

\LaTeX

- powerful typesetting system for text formation
- tedious syntax
- IDE is required

::::

:::: column

**Markdown**

- lightweight markup language
- intuitive syntax
- plain text editor is fine

::::

:::

### pandoc

- open source project
- converts markup formats
- allows to take the best from two words

# pandoc

## command line

### from md to beamer

```bash
pandoc --standalone              # needed for table of content
       --listings                # extend with listings package
                                 # to apply user defined code style
       --slide-level=3           # headings above level 3
                                 # are used as slides,
                                 # else as sections/subsections
       --to=beamer               # target file type
       --output=presentation.pdf # target file name
       slides.md                 # markdown coded presentation

```

## YAML metadata block

### Description

#### What it is?
Valid YAML object placed at beginning of the markdown file

#### How to use it
Separate with three hyphens (\-\-\-) at top and three dots (...) at bottom

```yaml
---
etc.
filds of interest
etc.
...
```

### Sample title page

```yaml
# title page setup
title:  'Presentation title'
subtitle: 'optional supplementary subtitle'
author:
- 'Author One'
- 'Author Two'
institute:
- 'Author One affiliation'
- 'Author Two affiliation'
#logo: image.png
#titlegraphic: somegraphic.png
date:
```

### Latex goodies

- done via *header-includes* field in the YAML header
- extend via **usepackage** as in \LaTeX
- reimplement functions
- add costume commands
- etc

# Markdown samples

## Presentations structure

### Hierarchy

1. Section: `# Section name`
1. Subsection: `## Subsection name`
1. Slides
    1. with title `### Slide title name`
    1. without title `---`

## Slide layouts

### Two columns of equal width

::: columns

:::: column

Left column text.

Another text line.

::::

:::: column

- Item 1.
- Item 2.
- Item 3.

::::

:::

### Two columns of with 40:60 split

::: columns

:::: {.column width=40%}

Left column text.

Another text line.

::::

:::: {.column width=60%}

- Item 1.
- Item 2.
- Item 3.

::::

:::

### Three columns with equal split

::: columns

:::: column

Left column text.

Another text line.

::::

:::: column

Middle column list:

1. Item 1.
2. Item 2.

::::

:::: column

Right column list:

- Item 1.
- Item 2.

::::

:::

### Three columns with 30:40:30 split

::: columns

:::: {.column width=30%}

Left column text.

Another text line.

::::

:::: {.column width=40%}

Middle column list:

1. Item 1.
2. Item 2.

::::

:::: {.column width=30%}

Right column list:

- Item 1.
- Item 2.

::::

:::

### Fancy layout

#### Proposal

- Point A
- Point B

::: columns

:::: column

#### Pros

- Good
- Better
- Best

::::

:::: column

#### Cons

- Bad
- Worse
- Worst

::::

:::

#### Conclusion

- Let's go for it!
- No way we go for it!

## Lists

### Unordered

- This is the first bullet item
- This is the second.

    To indent this sentence on the next line,
    the previous line ended in two spaces and
    this sentence is indented by four spaces.

- This is the third item
    - nest the third item
      
        and subsequent paragraph

    - continue the nest
- Last item

### Ordered

1. This is the first bullet item
1. This is the second.

    To indent this sentence on the next line,
    the previous line ended in two spaces and
    this sentence is indented by four spaces.

1. This is the third item
    1. nest the third item
      
        and subsequent paragraph

    1. continue the nest
1. Last item

## Tables

### Simple tables

Column A    Column B    Column C
---------  ----------  ---------
Category 1    High        100.00
Category 2    High         80.50
---------  ----------  ---------

### Multiline tables

--------------------------------
Column A    Column B      Column
                               C
---------  ----------  ---------
Category 1    High        100.00
High         95.00

Category 2    High         80.50
High         82.50
--------------------------------

### Grid tables

\footnotesize
+---------------+---------------+--------------------+
| Fruit         | Price         | Advantages         |
+===============+===============+====================+
| Bananas       | $1.34         | - built-in wrapper |
|               |               | - bright color     |
+---------------+---------------+--------------------+
| Oranges       | $2.10         | - cures scurvy     |
|               |               | - tasty            |
+---------------+---------------+--------------------+

+-----------+----------+-----------+
|Column A   |Column B  |   Column C|
+===========+==========+===========+
|Category 1 |100.00    | - point A |
|           |          | - point B |
+-----------+----------+-----------+
|Category 2 | 85.00    | - point C |
|           |          | - point D |
+-----------+----------+-----------+

### Pipe tables

| Default | left  | Center | Right  |
|---------|:------|:------:|-------:|
|   High  | Cat 1 | A      | 100.00 |
|   High  | Cat 2 | B      |  85.50 |
|   Low   | Cat 3 | C      |  80.00 |

## Math

### Sample usage

The formula, $y=mx+c$, is displayed inline.
Some symbols and equations (such as
$\sum{x}$ or $\frac{1}{2}$) are rescaled
to prevent disruptions to the regular
line spacing.
For more voluminous equations (such as
$\sum{\frac{(\mu - \bar{x})^2}{n-1}}$),
some line spacing disruptions are unavoidable.
Math should then be displayed in displayed mode.
$$\sum{\frac{(\mu - \bar{x})^2}{n-1}}$$

## overlays

### lists

::: columns

:::: {.column width=30%}

\begin{enumerate}[(I)]
\item<1-> Point A
\item<2-> Point B
\begin{itemize}
\item<3-> part 1
\item<4-> part 2
\end{itemize}
\item<5-> Point C
\item<6-> Point D
\end{enumerate}

::::

:::: {.column width=40%}
\setbeamercovered{transparent}

\onslide<1->{First Line of Text}

\onslide<2->{Second Line of Text}

\onslide<3->{Third Line of Text}

::::

:::: {.column width=30%}

\only<1>{First Line of Text}

\only<2>{Second Line of Text}

\only<3>{Third Line of Text}


::::

:::

### tables

\begin{table}
\begin{tabular}{l | c | c | c | c }
Competitor Name & Swim & Cycle & Run & Total \\
\hline \hline
John T & 13:04 & 24:15 & 18:34 & 55:53 \onslide<2-> \\
Norman P & 8:00 & 22:45 & 23:02 & 53:47 \onslide<3->\\
Alex K & 14:00 & 28:00 & n/a & n/a \onslide<4->\\
Sarah H & 9:22 & 21:10 & 24:03 & 54:35
\end{tabular}
\caption{Triathlon results}
\end{table}

### math blocks

\begin{theorem}<1->[Pythagoras]
$ a^2 + b^2 = c^2$
\end{theorem}
\begin{corollary}<3->
$ x + y = y + x  $
\end{corollary}
\begin{proof}<2->
$\omega +\phi = \epsilon $
\end{proof}

## tikz drawing

### example graphic

\begin{tikzpicture}[>=triangle 45,font=\sffamily]
    \node (X) at (0,0) {x};
    \node (Y) [below left=2cm and 1cm of X]  {y};% 2cm below, 1cm to the left (optional)
    \node (Z) [below right=2cm and 1cm of X] {z};
    \node (U) [below left=2cm and 1cm of Z]  {u};
    \draw [semithick,->] (X) -- (Y);
    \draw [semithick,->] (X) -- (Z);
    \draw [semithick,->] (Y) -- (U) node [midway,below,sloped] {*};
    \draw [semithick,->] (Z) -- (U) node [midway,below,sloped] {*};
\end{tikzpicture}
