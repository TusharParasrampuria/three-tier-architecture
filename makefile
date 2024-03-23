.PHONY: init validate plan apply clean destroy
.DEFAULT_GOAL := plan

ROOT := environments/$(ENV)
BACKEND := backend
DATABASE := database
FRONTEND := frontend
NETWORK := network

TF_DIR_PATH := $(ROOT)/$($(target))

PLAN_FILE := artifacts/$($(target)).tfplan


plan: validate $(wildcard *.tf)
	mkdir -p $(TF_DIR_PATH)/artifacts
	terraform -chdir=$(TF_DIR_PATH) plan -out=$(PLAN_FILE)

init:
	terraform -chdir=$(TF_DIR_PATH) init -backend-config=backend-config

validate: init
	terraform -chdir=$(TF_DIR_PATH) validate

apply: plan
	terraform -chdir=$(TF_DIR_PATH) apply -auto-approve $(PLAN_FILE)

destroy: init
	terraform -chdir=$(TF_DIR_PATH) destroy -auto-approve

clean:
	rm -rf $(TF_DIR_PATH)/artifacts
