#!/bin/bash
set -xeuo pipefail

# ENV for webroot where website will live
# JOB_NAME Running to update the website
# JOB_WEBSITE Location of content updated
WEB_ROOT=/var/lib/jenkins/userContent
JOB_NAME=cnv-sprint-automation
JOB_WEB_SITE=/var/lib/jenkins/jobs/${JOB_NAME}/lastSuccessful/archive/cnv_website

# Copy website from last run job over to userContent on Jenkins
/bin/mkdir -p ${WEB_ROOT}/history
/bin/rm -rf *.html stylesheets fonts *.csv
/bin/cp ${JOB_WEB_SITE}/*.html ${WEB_ROOT}/
/bin/cp ${JOB_WEB_SITE}/*.csv ${WEB_ROOT}/
/bin/cp -r ${JOB_WEB_SITE}/stylesheets ${WEB_ROOT}/
/bin/cp -r ${JOB_WEB_SITE}/fonts ${WEB_ROOT}/

# Create an archive of the website
TODAY=$(date '+%F')
ARCHIVE=${WEB_ROOT}/history/$TODAY/
/bin/mkdir -p ${ARCHIVE}
/bin/cp ${WEB_ROOT}/*.html ${ARCHIVE}
/bin/cp -r ${WEB_ROOT}/stylesheets ${ARCHIVE}/stylesheets
/bin/cp -r ${WEB_ROOT}/fonts ${ARCHIVE}/fonts

# Prune historical content from one year ago
PRUNEDATE=$(date --date='-2 year' '+%F')
PRUNEDIR=${WEB_ROOT}/history/${PRUNEDATE}
[ -d ${PRUNEDIR} ] && rm -rf ${PRUNEDIR}