 #!/bin/bash

echo "$1"


JAR="$HOME/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
export GRADLE_HOME=/usr/bin/gradle
$(echo "$2") \
  -Declipse.application=org.eclipse.jdt.ls.core.id1 \
  -Dosgi.bundles.defaultStartLevel=4 \
  -Declipse.product=org.eclipse.jdt.ls.core.product \
  -Dlog.protocol=true \
  -Dlog.level=ALL \
  -Xms1g \
  -Xmx2G \
  "-javaagent:$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar" \
  -jar $(echo "$JAR") \
  -configuration "$HOME/.local/share/nvim/mason/packages/jdtls/config_linux" \
  -data $(echo "$1") \
  --add-modules=ALL-SYSTEM \
  --add-opens java.base/java.util=ALL-UNNAMED \
  --add-opens java.base/java.lang=ALL-UNNAMED


