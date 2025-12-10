#!/bin/bash

ROOT_DIR="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
MAPPED_ROOT_DIR=$(echo "$ROOT_DIR" | sed 's/\//-/g')

if [[ $OSTYPE == 'darwin'* ]]; then
 JDTLS_CONFIG_NAME="config_mac"
else
 JDTLS_CONFIG_NAME="config_linux"
fi


JAR="$HOME/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
export GRADLE_HOME=/usr/bin/gradle
java \
  -Declipse.application=org.eclipse.jdt.ls.core.id1 \
  -Dosgi.bundles.defaultStartLevel=4 \
  -Declipse.product=org.eclipse.jdt.ls.core.product \
  -Dlog.protocol=true \
  -Dlog.level=ALL \
  -Xms1g \
  -Xmx2G \
  "-javaagent:$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar" \
  -jar $(echo "$JAR") \
  -configuration "$HOME/.local/share/nvim/mason/packages/jdtls/$JDTLS_CONFIG_NAME" \
  -data $(echo "$ROOT_DIR/.jdtls") \
  --add-modules=ALL-SYSTEM \
  --add-opens java.base/java.util=ALL-UNNAMED \
  --add-opens java.base/java.lang=ALL-UNNAMED


