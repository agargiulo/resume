stage: resume stage_upload

all:resume upload

upload:stage
	ssh www.anthonygargiulo.info 'cp -rv /var/www/html/resume/ /var/www/resume/'

html: resume.tex
	pygmentize -f html -O full,style=colorful,linenos=1 -l latex -o resume.tex.html resume.tex

resume:
	pdflatex -shell-escape resume.tex

stage_upload:resume.pdf html
	scp resume.pdf agargiulo@www.anthonygargiulo.info:/var/www/html/resume/resume.pdf
	scp resume.tex agargiulo@www.anthonygargiulo.info:/var/www/html/resume/resume.tex
	scp resume.tex.html agargiulo@www.anthonygargiulo.info:/var/www/html/resume/resume.tex.html
	scp resume-pics.pdf agargiulo@www.anthonygargiulo.info:/var/www/html/resume/resume-pics.pdf
