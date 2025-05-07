import QtQuick
import QtQuick3D
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    View3D {
            anchors.fill: parent
            camera: PerspectiveCamera { position: Qt.vector3d(0, 0, 600) }

            // Model {
            //     id: cube
            //     source: "#Cube"
            //     materials: [ DefaultMaterial { diffuseColor: "red" } ]
            //     Behavior on position.x { NumberAnimation { duration: 200 } }
            //     Behavior on position.y { NumberAnimation { duration: 200 } }
            // }

            Model {
                source: "qrc:/Re"
            }

            DirectionalLight { }
        }

        Row {
            anchors.bottom: parent.bottom
            spacing: 10

            Button {
                text: "Влево"
                onClicked: cube.position.x -= 50
            }
            Button {
                text: "Вправо"
                onClicked: cube.position.x += 50
            }
            Button {
                text: "Вверх"
                onClicked: cube.position.y += 50
            }
            Button {
                text: "Вниз"
                onClicked: cube.position.y -= 50
            }
            Button {
                text: "Вращать x"
                onClicked: cube.eulerRotation.y += 15
            }
            Button {
                text: "Вращать y"
                onClicked: cube.eulerRotation.x += 15
            }
            Button {
                text: "Вращать z"
                onClicked: cube.eulerRotation.z += 15
            }
        }
}

