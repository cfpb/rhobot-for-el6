#!/bin/bash
set -x #echo on

RHOVERS=${RHOBOTVERSION:-0.2}

sed -i -e s#"RHOBOTVERSION"#"${RHOVERS}"#g rhobot.spec

rm -rf rhobot-${RHOVERS}/
cp -rpf -R ../rhobot rhobot-${RHOVERS}/
tar -czf rhobot-${RHOVERS}.tar.gz rhobot-${RHOVERS}/

rm -rf rpmbuild
mkdir -p rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
cp rhobot.spec rpmbuild/SPECS/rhobot.spec
mv rhobot-${RHOVERS}.tar.gz rpmbuild/SOURCES


cd rpmbuild/
rpmbuild --define "_topdir `pwd`" -ba SPECS/rhobot.spec
