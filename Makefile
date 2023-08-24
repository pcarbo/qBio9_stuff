# A Makefile for generating the R Markdown and PDF from the Jupyter
# notebook.

# RULES
# -----
# Create the R Markdown.
basic_computing_qbio9.Rmd : basic_computing_qbio9.ipynb
	Rscript -e 'rmarkdown::convert_ipynb("basic_computing_qbio9.ipynb")'

dataviz_qbio9.Rmd : dataviz_qbio9.ipynb
	Rscript -e 'rmarkdown::convert_ipynb("dataviz_qbio9.ipynb")'

# Create the PDFs.
basic_computing_qbio9.pdf : basic_computing_qbio9.Rmd readable.tex
	Rscript -e 'rmarkdown::render("basic_computing_qbio9.Rmd",output_file="basic_computing_qbio9.pdf")'

dataviz_qbio9.pdf : dataviz_qbio9.Rmd readable.tex
	Rscript -e 'rmarkdown::render("dataviz_qbio9.Rmd",output_file="dataviz_qbio9.pdf")'

clean:
	rm -f basic_computing_qbio9.Rmd
	rm -f basic_computnig_qbio9.pdf

