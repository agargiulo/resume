FILES = resume.pdf resume.tex resume.tex.html #resume-pics.pdf

stage: resume.pdf stage_upload

all: resume.pdf upload

upload:stage
	ssh -4 -oVisualHostKey=no ec2-user@www.agargiulo.com 'cp -r /var/www/html/resume/* /var/www/resume/'

resume.tex.html: resume.tex
	pygmentize -f html -O full,style=colorful,linenos=1 -l latex -o resume.tex.html resume.tex

resume.pdf: resume.tex
	pdflatex resume.tex

stage_upload:resume.pdf resume.tex.html
	scp -4 -oVisualHostKey=no $(FILES) ec2-user@www.agargiulo.com:/var/www/html/resume/
