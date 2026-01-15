clickDir=$(pwd)
if ! [ -z ${APP_ID} ]; then
    if ! [ -z ${XDG_CONFIG_HOME} ]; then
        appName=$(echo ${APP_ID} | utils/cut.py '_' 1)
        activeDir=${XDG_CONFIG_HOME}/${appName}
        utils/mkdir.py ${activeDir}
        cd ${activeDir}
    fi
fi
${clickDir}/openjdk/bin/java -jar ${clickDir}/freej2me.jar "file://${clickDir}/midlet.jar"