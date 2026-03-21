clickDir=$(pwd)
if ! [ -z ${APP_ID} ]; then
    if ! [ -z ${XDG_CONFIG_HOME} ]; then
        appName=$(echo ${APP_ID} | utils/cut.py '_' 1)
        activeDir=${XDG_CONFIG_HOME}/${appName}
        utils/mkdir.py ${activeDir}
    fi
fi

DOLOOP=true
while ${DOLOOP}; do
    DOLOOP=false
    cd ${clickDir}
    qmlscene qml/Main.qml
    if [ -f ${activeDir}/runJar ]; then
        DOLOOP=true
        rm ${activeDir}/runJar
        cd ${activeDir}
        ${clickDir}/runtime/bin/java -jar ${clickDir}/freej2me.jar "file://${clickDir}/midlet.jar"
    fi
done