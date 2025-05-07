#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <Qt3DCore>
#include <Qt3DRender>
#include <Qt3DInput>
#include <Qt3DLogic>
#include <Qt3DExtras>
#include <Qt3DAnimation>
#include <QNetworkInterface>
#include <QStringList>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("table_control", "Main");

    return app.exec();
}

// class NetworkInfoProvider : public QObject {
//     Q_OBJECT
//     Q_PROPERTY(QStringList ipList READ ipList NOTIFY ipListChanged)

//     public:
//         QStringList ipList() const {
//             QStringList addresses;
//             for (const QNetworkInterface& interface : QNetworkInterface::allInterfaces()) {
//                 if (interface.flags() & QNetworkInterface::IsUp &&
//                     !(interface.flags() & QNetworkInterface::IsLoopBack)) {
//                     for (const QNetworkAddressEntry& entry : interface.addressEntries()) {
//                         if (entry.ip().protocol() == QAbstractSocket::IPv4Protocol) {
//                             addresses.append(entry.ip().toString());
//                         }
//                     }
//                 }
//             }
//             return addresses;
//         }

// signals:
//     void ipListChanged();
// };

// qmlRegisterType<NetworkInfoProvider>("Network", 1, 0, "NetworkInfoProvider");
