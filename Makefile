AI = AdvancedInstaller.com
MT = "/cygdrive/c/Program Files (x86)/Microsoft SDKs/Windows/v7.1A/Bin/mt.exe"


.PHONY: all clean


all: just-install.msi


clean:
	rm -f just-install.exe
	rm -f just-install.msi
	rm -rf deploy/just-install-cache


just-install.msi: just-install.exe
	cd deploy && $(AI) /rebuild just-install.aip


just-install.exe: just-install.go
	go build just-install.go
	$(MT) -manifest deploy/just-install.exe.manifest -outputresource:"just-install.exe;1"
	deploy/upx --best just-install.exe