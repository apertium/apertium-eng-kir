all: tests

tests: tests-kir-eng tests-eng-kir

kir-eng.tests.txt kir.tests.txt:
	./scrapeTransferTests.py -p kir-eng "English_and_Kyrgyz/Transfer_tests"
eng-kir.tests.txt eng.tests.txt:
	./scrapeTransferTests.py -p eng-kir "English_and_Kyrgyz/Transfer_tests"

kir-eng.output.txt: kir.tests.txt ../
	cat $< | apertium -d ../ kir-eng > $@

eng-kir.output.txt: eng.tests.txt ../
	cat $< | apertium -d ../ eng-kir > $@

tests-kir-eng: kir-eng.tests.txt kir-eng.output.txt
	wdiff kir-eng.tests.txt kir-eng.output.txt | colordiff
	apertium-eval-translator-line -r kir-eng.tests.txt -t kir-eng.output.txt

tests-eng-kir: eng-kir.tests.txt eng-kir.output.txt
	wdiff eng-kir.tests.txt eng-kir.output.txt | colordiff
	apertium-eval-translator-line -r eng-kir.tests.txt -t eng-kir.output.txt

clean:
	rm *.tests.txt *.output.txt
