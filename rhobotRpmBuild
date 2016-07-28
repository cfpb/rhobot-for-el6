#!/bin/bash

RHOBOTVERSION=0.2
sed -i -e s#"RHOBOTVERSION"#"${RHOBOTVERSION}"#g rhobot.spec

cp -rpf -R playground rhobot-${RHOBOTVERSION}/
tar -czf rhobot-0.1.tar.gz rhobot-${RHOBOTVERSION}/

mkdir -p rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
cp rhobot.spec rpmbuild/SPECS/rhobot.spec
mv rhobot-${RHOBOTVERSION}.tar.gz rpmbuild/SOURCES

cd rpmbuild/
rpmbuild --define "_topdir `pwd`" -ba SPECS/rhobot.spec
