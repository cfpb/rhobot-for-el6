Name:           rhobot
Version:        RHOBOTVERSION
Release:        1
Summary:        a database devops command line tool
License:        GPLv3+
URL:            https://github.com/cfpb/rhobot
Source0:        rhobot-RHOBOTVERSION.tar.gz

## TODO add source as direct github link
#Source0:        https://github.com/cfpb/rhobot/archive/v%{version}.tar.gz

BuildRequires:  gcc
BuildRoot: %{_tmpdir}/%{name}-%{version}-%{release}
%define debug_package %{nil}

## TODO add dependencies as github or gopkg links
# BuildRequires:  golang >= 1.2-7
## pull in golang libraries by explicit import path, inside the meta golang()
# BuildRequires:  golang(github.com/gorilla/mux) >= 0-0.13

%description
# include your full description of the application here.

%prep
%setup -q -n rhobot-%{version}

## many golang binaries are "vendoring" (bundling) sources, so remove them. Those dependencies need to be packaged independently.
# rm -rf vendor

%build
## TODO set up temporary build gopath, and put our directory there
# mkdir -p ./_build/src/github.com/cfpb
# ln -s $(pwd)/ ./_build/src/github.com/cfpb/rhobot
# export GOPATH=$(pwd)/_build:%{gopath}

export WORKDIR=$(pwd)
export GOPATH=$(pwd)/gopath
export GOROOT=$(pwd)/go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

go get github.com/tools/godep
cd $GOPATH/src/github.com/cfpb/rhobot
godep restore
go build -o rhobot
cp rhobot $WORKDIR

%install
install -d %{buildroot}%{_bindir}
install -p -m 0755 ./rhobot %{buildroot}%{_bindir}/rhobot

%files
%defattr(-,root,root,-)
## TODO create these files for rhobot rpm repo
#%doc AUTHORS CHANGELOG.md CONTRIBUTING.md FIXME LICENSE MAINTAINERS NOTICE README.md
%{_bindir}/rhobot
