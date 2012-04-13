FILES = resume.pdf resume.tex resume.tex.html resume-pics.pdf

stage: resume stage_upload

all:resume upload

upload:stage
	ssh www.agargiulo.com 'cp -rv /var/www/html/resume/* /var/www/resume/'

html: resume.tex
	pygmentize -f html -O full,style=colorful,linenos=1 -l latex -o resume.tex.html resume.tex

resume:resume.tex
	pdflatex -shell-escape resume.tex

stage_upload:resume.pdf html
	scp $(FILES) agargiulo@www.agargiulo.com:/var/www/html/resume/
