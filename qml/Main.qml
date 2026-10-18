import QtQuick 2.7
import Lomiri.Components 1.3
import QtQuick.Window 2.12

import Jar 0.1

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

            text: i18n.tr("Run MIDlet")
            onClicked: {
                var width = Window.width
                var height = Window.height
                var widthScaling = Math.floor(width / 240)
                var heightScaling = Math.floor(height / 320)

                Jar.run(Math.min(widthScaling, heightScaling))
            }
        }
    }
}
