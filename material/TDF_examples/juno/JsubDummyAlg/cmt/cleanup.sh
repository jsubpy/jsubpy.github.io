# echo "cleanup JsubDummyAlg v0 in /junofs/users/yangyf/jsub/examples/juno"

if test "${CMTROOT}" = ""; then
  CMTROOT=/cvmfs/juno.ihep.ac.cn/sl6_amd64_gcc830/Pre-Release/J20v1r1-branch/ExternalLibs/CMT/v1r26; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh
cmtJsubDummyAlgtempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then cmtJsubDummyAlgtempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt cleanup -sh -pack=JsubDummyAlg -version=v0 -path=/junofs/users/yangyf/jsub/examples/juno  $* >${cmtJsubDummyAlgtempfile}
if test $? != 0 ; then
  echo >&2 "${CMTROOT}/mgr/cmt cleanup -sh -pack=JsubDummyAlg -version=v0 -path=/junofs/users/yangyf/jsub/examples/juno  $* >${cmtJsubDummyAlgtempfile}"
  cmtcleanupstatus=2
  /bin/rm -f ${cmtJsubDummyAlgtempfile}
  unset cmtJsubDummyAlgtempfile
  return $cmtcleanupstatus
fi
cmtcleanupstatus=0
. ${cmtJsubDummyAlgtempfile}
if test $? != 0 ; then
  cmtcleanupstatus=2
fi
/bin/rm -f ${cmtJsubDummyAlgtempfile}
unset cmtJsubDummyAlgtempfile
return $cmtcleanupstatus

