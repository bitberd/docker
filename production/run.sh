 if [ -z "$START_GEARMAN" ]; then service gearman-job-server restart; fi
 if [ -z "$START_SPHINX" ]; then service sphinxsearch restart; fi
 tail -f logs/* & /bin/bash
