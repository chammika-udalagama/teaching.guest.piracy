#!/bin/bash

echo "-----------------------------------> Knitting site."
R -e "rmarkdown::clean_site()"

#R -e "Sys.setenv(RSTUDIO_PANDOC='/Applications/RStudio.app/Contents/MacOS/pandoc');rmarkdown::render_site(output_format = 'bookdown::bs4_book', encoding = 'UTF-8')"

R -e "Sys.setenv(RSTUDIO_PANDOC='/usr/lib/rstudio/bin/pandoc');rmarkdown::render('webpage.Rmd',output_file = 'index.html',output_dir = './docs')"

cp -r pdf-files ./docs

#R -e "bookdown::bs4_book(theme = bookdown::bs4_book_theme(), repo = NULL,  lib_dir = "libs", pandoc_args = NULL, extra_dependencies = NULL,   split_bib = FALSE)"
