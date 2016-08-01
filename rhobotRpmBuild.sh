#!/bin/bash
set -x #echo on

RHOBOTVERSION=0.2
sed -i -e s#"RHOBOTVERSION"#"${RHOBOTVERSION}"#g rhobot.spec

rm -rf rhobot-${RHOBOTVERSION}/
cp -rpf -R ../rhobot rhobot-${RHOBOTVERSION}/
tar -czf rhobot-${RHOBOTVERSION}.tar.gz rhobot-${RHOBOTVERSION}/

rm -rf rpmbuild
mkdir -p rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
cp rhobot.spec rpmbuild/SPECS/rhobot.spec
mv rhobot-${RHOBOTVERSION}.tar.gz rpmbuild/SOURCES

cd rpmbuild/
rpmbuild --define "_topdir `pwd`" -ba SPECS/rhobot.spec
