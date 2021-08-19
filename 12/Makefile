PAGES = \
	index \
	rules \
	teams

PAGES_HTML := $(addprefix out/, $(addsuffix .html, $(PAGES)))

TASKS = one two
TASKS_MD := $(addprefix tasks/, $(addsuffix .md, $(TASKS)))
TASKS_ODT := $(addprefix out/task-, $(addsuffix .odt, $(TASKS)))
all: $(PAGES_HTML) $(TASKS_ODT) out/rules.odt out/tasks.html out/score.html

.PHONY: all clean

.FORCE:

out/%.html: %.md template.html
	pandoc --template template.html -o $@ $<

out/task-%.odt: tasks/%.md 
	pandoc -o $@ $<

out/teams.html: teams.csv header-teams.md template.html
	./bin/teams2md.sh teams.csv | cat header-teams.md - | pandoc --template template.html >out/teams.html

out/rules.odt: rules.md
	pandoc -o out/rules.odt rules.md

out/tasks.html: tasks/*.md
	./bin/create_task_html.sh | pandoc --template template.html > out/tasks.html

out/score.html: score.csv teams.csv tasks/*.md Makefile
	./bin/mk_score_html.sh "$(TASKS)" | pandoc --template template.html > out/score.html

clean:
	rm -f out/*.html out/*.odt
