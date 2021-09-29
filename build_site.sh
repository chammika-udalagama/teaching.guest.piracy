#!/bin/bash


echo "-----------------------------------> Knitting site."
R -e "rmarkdown::clean_site()"

#R -e "Sys.setenv(RSTUDIO_PANDOC='/Applications/RStudio.app/Contents/MacOS/pandoc');rmarkdown::render_site(output_format = 'bookdown::bs4_book', encoding = 'UTF-8')"

R -e "Sys.setenv(RSTUDIO_PANDOC='/usr/lib/rstudio/bin/pandoc');rmarkdown::render('webpage.Rmd',output_file = 'index.html',output_dir = './docs')"

cp -r files ./docs

#R -e "bookdown::bs4_book(theme = bookdown::bs4_book_theme(), repo = NULL,  lib_dir = "libs", pandoc_args = NULL, extra_dependencies = NULL,   split_bib = FALSE)"

echo '---------------------> Cleaning up unnecessary files'
rm webpage.html
rm -r webpage_files


echo '---------------------> Pushing and committing to main'
now=$(date +"%Y-%m-%d %T")
git add docs webpage.Rmd build_site.sh
git commit -m "Automatic Commit to main at $now"
git push

echo '---------------------> Copying docs to gh-pages and pushing'
git checkout gh-pages
git checkout main docs
now=$(date +"%Y-%m-%d %T")
git commit -m "Automatic Commit to gh-pages at $now"
git push

echo '---------------------> Switching to main'
git checkout main
