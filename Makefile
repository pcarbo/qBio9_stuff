# A Makefile for generating the R Markdown and PDF from the Jupyter
# notebook.
#

# RULES
# -----
all: basic_computing_qbio9.Rmd

# Create the R Markdown.
basic_computing_qbio9.Rmd : basic_computing_qbio9.ipynb
	Rscript -e 'rmarkdown::convert_ipynb("basic_computing_qbio9.ipynb")'

# Create the PDF.
basic_computing_qbio9.pdf : basic_computing_qbio9.Rmd readable.tex
	Rscript -e 'rmarkdown::render("basic_computing_qbio9.Rmd",output_file="basic_computing_qbio9.pdf")'

clean:
	rm -f basic_computing_qbio9.Rmd
	rm -f basic_computnig_qbio9.pdf

