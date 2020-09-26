CRYSTAL_BIN ?= `which crystal`
SAM_PATH ?= "./src/sam.cr"

sam:
	$(CRYSTAL_BIN) $(SAM_PATH) $(filter-out $@,$(MAKECMDGOALS))

create:
  $(CRYSTAL_BIN) $(SAM_PATH) db:create

migrate:
  $(CRYSTAL_BIN) $(SAM_PATH) db:migrate

drop:
  $(CRYSTAL_BIN) $(SAM_PATH) db:drop

run:
	$(CRYSTAL_BIN) run ./src/application.cr