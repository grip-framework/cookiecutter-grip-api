CRYSTAL_BIN ?= `which crystal`
SAM_PATH ?= "./src/sam.cr"
.PHONY: sam
sam:
	$(CRYSTAL_BIN) $(SAM_PATH) $(filter-out $@,$(MAKECMDGOALS))
%:
	@:	
run:
	$(CRYSTAL_BIN) run ./src/application.cr
