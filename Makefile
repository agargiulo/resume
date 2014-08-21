FILES = resume.pdf resume.tex resume.tex.html #resume-pics.pdf
USER = agargiulo
WEB_HOST = www.agargiulo.com
STAGE_PATH = /var/www/html/resume/
LIVE_PATH = /var/www/resume/

stage: resume.pdf stage_upload

all: resume.pdf upload

upload:stage
	ssh -4 -oVisualHostKey=no $(USER)@$(WEB_HOST) 'cp -rv $(STAGE_PATH)* $(LIVE_PATH)'

resume.tex.html: resume.tex
	pygmentize -f html -O full,style=colorful,linenos=1 -l latex -o resume.tex.html resume.tex

resume.pdf: resume.tex
	pdflatex resume.tex

stage_upload:resume.pdf resume.tex.html
	scp -4 -oVisualHostKey=no $(FILES) $(USER)@$(WEB_HOST):$(STAGE_PATH)
