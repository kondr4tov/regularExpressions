import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: "Make transition"

    Rectangle {
        id: scene
        anchors.fill: parent
        state: "mainState"

        Rectangle {
            id: leftRectangle
            x: 100
            y: 200
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5

            MouseArea {
                anchors.fill: parent
                onClicked:
                    if (ball.x + (ball.width / 2) >= (rightRectangle.x) - rightRectangle.width / 2) {
                        scene.state = "mainState"
                    }
                    else {
                        ball.x += 15
                        scene.state = "moveState"
                    }
            }
        }

        Rectangle {
            id: rightRectangle
            x: 300
            y: 200
            color: "lightgrey"
            width: 100
            height: 100
            border.color: "black"
            border.width: 3
            radius: 5

            MouseArea {
                anchors.fill: parent
                onClicked: scene.state = "mainState"
            }
        }

        Rectangle {
            id: ball
            color: "yellow"
            x: leftRectangle.x + 5
            y: leftRectangle.y + 5
            width: leftRectangle.width - 10
            height: leftRectangle.height - 10
            radius: width / 2
        }

        states: [
            State {
                name: "mainState"
                PropertyChanges {
                    target: ball
                    x: leftRectangle.x + 5
                }
            } ,
            State {
                name: "moveState"
                PropertyChanges {
                    target: ball
                    x: ball.x
                }
            }
        ]

        transitions: [
            Transition {
                from: "moveState"
                to: "mainState"
                NumberAnimation {
                    properties: "x,y"
                    duration: 1000
                    easing.type: Easing.OutInBack
                }
            }
        ]
    }

}
