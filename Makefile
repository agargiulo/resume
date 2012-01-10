all:resume upload

upload:resume.pdf
	scp resume.pdf agargiulo@www.anthonygargiulo.info:/var/www/resume/resume.pdf


resume:resume.tex
	pdflatex -shell-escape resume.tex

