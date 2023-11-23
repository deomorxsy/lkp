#!/bin/bash
# aarch64

PROOTPATH="${PREFIX}/share/TermuxAlpine/home/scripts/"

main() {
    movestr
}

# redirect heredoc to script and save it on emulated proot storage
movestr() {
cat << EOF > ~/setalpine.sh
#!/usr/bin/bash
apk update
apk upgrade
apk add openjdk17
apk add nodejs
EOF
mkdir -p $PROOTPATH
cp "~/setalpine.sh" $PROOTPATH

}
