#!/bin/bash
SHELL := /bin/bash
.PHONY: run clean build sim

# Set current folder as d_work
d_work=$(shell pwd)

# Code compilation path
PROJECT=$(shell basename `git rev-parse --show-toplevel`)
PROJECT_BRANCH=$(shell git rev-parse --abbrev-ref HEAD)
d_build=~/build/${PROJECT}/${PROJECT_BRANCH}

d_sim=$(d_work)/run
d_src:=$(d_work)/../../../src
d_tb_src:=$(d_work)/src


# Simulation parameters
UVM_verbosity=UVM_LOW
gui             = 0
seed_random     = 0
seed            = itmo
verification    = 1
uvm             = 1
coverage        = 0
num_test_trans  = 3_000 #reminder: will not affect when GUI rebuild
num_tests       = 1


v_src_list_l1d=$(d_work)/filelist.sv
# Scan and add all src and tb_src folders as +incdir+
inc_dir_tb_list  := $(shell find ${d_tb_src} -type d | sed 's/\/home/+incdir+\/home/' | tr '\n' ' ')
inc_dir_rtl_list := $(shell find ${d_src} -type d | sed 's/\/home/+incdir+\/home/' | tr '\n' ' ')

v_vcs_build_options = -full64 -lca \
											-sverilog \
											+notimingcheck \
											-notice \
											-timescale=1ns/1ps \
											$(inc_dir_rtl_list) \
											$(inc_dir_tb_list) \
											-cm_cond allops \
											-nc \
											-debug_all \
											-debug_access+all \
											-l build.log

v_vcs_sim_options = -l sim.log \
										-assert global_finish_maxfail=5 \
										-assert nopostproc \
										+tracelog=1 \
										+tracelog_time=1

ifeq ($(gui),1)
  v_vcs_sim_options += -gui
endif

ifeq ($(uvm),1)
	# Strip "_" in num_test_trans
	num_trans=$(subst _,,${num_test_trans})
	timeout_time=$(shell echo ${num_trans}*100000 | bc)
  # Simulation time out
  v_vcs_build_options += -ntb_opts uvm-1.2 \
											+define+NUM_OF_TRANS=$(num_test_trans) \
											# +define+UVM_REPORT_DISABLE_FILE_LINE
											+define+VERBOSITY=$(UVM_verbosity)

	v_vcs_sim_options += 	+UVM_NO_RELNOTES \
												+UVM_TR_RECORD  \
												+UVM_VERBOSITY=$(UVM_verbosity) \
												+UVM_TIMEOUT=$(timeout_time)ns,NO \
												+UVM_MAX_QUIT_COUNT=1
endif

ifeq ($(verification),1)
  v_vcs_build_options += -cm assert
  v_vcs_sim_options   += -cm assert
endif

ifeq ($(coverage),1)
  v_vcs_build_options += -cm line+cond+fsm+tgl+branch
  v_vcs_sim_options   += -cm line+cond+fsm+tgl+branch
endif

run: clean build sim

clean:
	rm -rf $(d_build)
	rm -rf $(d_sim)

build:
	mkdir -p $(d_build) &&     \
	cd $(d_build) &&           \
	vcs $(v_vcs_build_options) $(v_src_list_l1d)

sim:
	mkdir -p $(d_sim) && \
	cd $(d_sim) && \
	i=$(num_tests); \
	for ((i=1; i <= $(num_tests); ++i)); do \
		echo "--------------------------------"; \
		echo "TEST $$i"; \
		if [ $(seed_random) -eq 1 ]; \
		then \
			echo -n "Using random seed. "; \
			seed=$$(date +%s); \
			echo -n "Seed is "; \
			echo \"$$seed\"; \
		else \
			echo -n "Using non-random seed. "; \
			seed=$(seed); \
			echo -n "Seed is "; \
			echo \"$$seed\" ; \
		fi; \
		$(d_build)/simv -cm line +number=$$i -cm_name test_$$i $(v_vcs_sim_options) +ntb_random_seed=$$seed; \
	done; \
	if [ $(coverage) -eq 1 ]; then        \
	  urg -dir $(d_build)/simv.vdb -show brief; \
	fi