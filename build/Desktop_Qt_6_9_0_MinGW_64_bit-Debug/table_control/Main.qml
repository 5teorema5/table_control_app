import QtQuick
import QtQuick3D
import QtQuick3D.Helpers
import QtQuick.Controls
// import Network

ApplicationWindow {
    width: 1024
    height: 720
    visible: true
    title: qsTr("table control")

    View3D {
            anchors.fill: parent

            environment: SceneEnvironment {
                backgroundMode: SceneEnvironment.Color
                clearColor: "green"
            }

            PerspectiveCamera {
                id: camera
            }

            WasdController {
                controlledObject: camera
            }
        }

    ComboBox {
        id: ipCombo
        model: {
            var result = []
            var interfaces = Qt.network.interfaces
            for (var i in interfaces) {
                var addresses = Qt.network.interfaceAddresses(interfaces[i])
                for (var j in addresses) {
                    if (Qt.network.isIPv4Address(addresses[j])) {
                        result.push(addresses[j])
                    }
                }
            }
            return result
        }
    }

    // NetworkInfoProvider {
    //         id: networkInfo
    //     }

    // ComboBox {
    //     id: ipComboBox
    //     width: 200
    //     anchors.centerIn: parent
    //     model: networkInfo.ipList
    //     currentIndex: 0

    //     // Стилизация (опционально)
    //     delegate: ItemDelegate {
    //         width: ipComboBox.width
    //         text: modelData
    //         highlighted: ipComboBox.highlightedIndex === index
    //     }

    //     onCurrentTextChanged: {
    //         console.log("Selected IP:", currentText)
    //         // Здесь можно использовать выбранный IP
    //     }
    //     }
}





// import QtQuick
// import QtQuick3D
// import QtQuick.Controls

// Window {
//     width: 1024
//     height: 720
//     visible: true
//     title: qsTr("table control")

//     property string modelPath: "file:/C:/Users/lokhm/Projects/qt-projects/table_control/assets/BoomBox.glb"

//     View3D {
//         anchors.fill: parent
//         camera: camera

//         environment: SceneEnvironment {
//             backgroundMode: SceneEnvironment.Color
//             clearColor: "#222222"
//         }

//         PerspectiveCamera {
//             id: camera
//             position: Qt.vector3d(0, 0, 300)
//             clipNear: 10
//             clipFar: 10000
//         }

//         DirectionalLight {
//             brightness: 2
//             eulerRotation.x: -30
//             eulerRotation.y: 30
//         }

//         Node {
//             id: sceneRoot

//             // Model {
//             //     id: customModel
//             //     source: "#Cube"
//             //     materials: [ DefaultMaterial { diffuseColor: "red" } ]
//             //     Behavior on position.x { NumberAnimation { duration: 200 } }
//             //     Behavior on position.y { NumberAnimation { duration: 200 } }
//             // }


//             Model {
//                 id: customModel
//                 source: modelPath
//                 scale: Qt.vector3d(10, 10, 10)  // Масштабирование модели

//                 materials: [
//                     DefaultMaterial {
//                         diffuseColor: "red"  // Базовый цвет, если у модели нет материалов
//                     }
//                 ]

//                 Behavior on position {
//                     PropertyAnimation { duration: 200 }
//                 }

//                 Behavior on eulerRotation {
//                     PropertyAnimation { duration: 200 }
//                 }
//             }
//         }
//     }

//     Row {
//         anchors.bottom: parent.bottom
//         anchors.horizontalCenter: parent.horizontalCenter
//         spacing: 10
//         bottomPadding: 20

//         Button {
//             text: "Влево"
//             onClicked: customModel.position = Qt.vector3d(customModel.position.x - 20, customModel.position.y, customModel.position.z)
//         }
//         Button {
//             text: "Вправо"
//             onClicked: customModel.position = Qt.vector3d(customModel.position.x + 20, customModel.position.y, customModel.position.z)
//         }
//         Button {
//             text: "Вверх"
//             onClicked: customModel.position = Qt.vector3d(customModel.position.x, customModel.position.y + 20, customModel.position.z)
//         }
//         Button {
//             text: "Вниз"
//             onClicked: customModel.position = Qt.vector3d(customModel.position.x, customModel.position.y - 20, customModel.position.z)
//         }
//         Button {
//             text: "Вращать X"
//             onClicked: customModel.eulerRotation.x += 15
//         }
//         Button {
//             text: "Вращать Y"
//             onClicked: customModel.eulerRotation.y += 15
//         }
//         Button {
//             text: "Вращать Z"
//             onClicked: customModel.eulerRotation.z += 15
//         }
//         Button {
//             text: "Сброс"
//             onClicked: {
//                 customModel.position = Qt.vector3d(0, 0, 0)
//                 customModel.eulerRotation = Qt.vector3d(0, 0, 0)
//             }
//         }
//     }

//     // Информационная панель
//     Rectangle {
//         anchors.top: parent.top
//         anchors.left: parent.left
//         anchors.margins: 10
//         width: 450
//         height: 80
//         color: "#80000000"
//         radius: 10

//         Column {
//             anchors.fill: parent
//             anchors.margins: 5
//             spacing: 5

//             Text {
//                 color: "white"
//                 text: "Модель: " + modelPath
//                 font.pixelSize: 12
//                 elide: Text.ElideMiddle
//             }

//             Text {
//                 color: "white"
//                 text: "Позиция: " +
//                       customModel.position.x.toFixed(1) + ", " +
//                       customModel.position.y.toFixed(1) + ", " +
//                       customModel.position.z.toFixed(1)
//                 font.pixelSize: 12
//             }

//             Text {
//                 color: "white"
//                 text: "Вращение: " +
//                       customModel.eulerRotation.x.toFixed(1) + ", " +
//                       customModel.eulerRotation.y.toFixed(1) + ", " +
//                       customModel.eulerRotation.z.toFixed(1)
//                 font.pixelSize: 12
//             }
//         }
//     }
// }
