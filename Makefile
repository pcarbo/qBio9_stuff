# A Makefile for generating the R Markdown and PDF from the Jupyter
# notebook.
#

# RULES
# -----
all: basic_computing_qbio9.Rmd

# Create the R Markdown.
basic_computing_qbio9.Rmd : basic_computing_qbio9.ipynb
	Rscript -e 'rmarkdown::convert_ipynb("basic_computing_qbio9.ipynb")'

clean:
	rm -f basic_computing_qbio9.Rmd

