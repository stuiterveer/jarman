import QtQuick 2.7
import Lomiri.Components 1.3
import io.thp.pyotherside 1.4
import QtQuick.Window 2.12

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
                var width = Screen.desktopAvailableWidth
                var height = Screen.desktopAvailableHeight
                var widthScaling = Math.floor(width / 240)
                var heightScaling = Math.floor(height / 320)

                python.call('jar.runJar', [Math.min(widthScaling, heightScaling)], function(returnValue) {
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
