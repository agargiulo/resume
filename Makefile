all:resume upload html

upload:resume.pdf html
	scp resume.pdf agargiulo@www.anthonygargiulo.info:/var/www/resume/resume.pdf
	scp resume.tex agargiulo@www.anthonygargiulo.info:/var/www/resume/resume.tex
	scp resume.tex.html agargiulo@www.anthonygargiulo.info:/var/www/resume/resume.tex.html
	scp resume-pics.pdf agargiulo@www.anthonygargiulo.info:/var/www/resume/resume-pics.pdf

html: resume.tex
	pygmentize -f html -O full,style=colorful,linenos=1 -l latex -o resume.tex.html resume.tex

resume:resume.tex
	pdflatex -shell-escape resume.tex

