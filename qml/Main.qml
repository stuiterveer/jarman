import QtQuick 2.7
import Lomiri.Components 1.3
import io.thp.pyotherside 1.4

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'jarman.stuiterveer'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: 'JarMan'
        }

        Button {
            anchors {
                top: header.bottom
                left: parent.left
            }

            text: "Run MIDlet"
            onClicked: {
                python.call('jar.runJar', [], function(returnValue) {
                    Qt.quit();
                });
            }
        }
    }

    Python {
        id: python

        Component.onCompleted: {
            addImportPath(Qt.resolvedUrl('../utils/'));

            importModule('jar', function() {
                console.log('module jar imported');
            });
        }

        onError: {
            console.log('python error: ' + traceback);
        }
    }
}
