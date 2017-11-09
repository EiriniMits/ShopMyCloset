TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    message.cpp \
    clientsmodel.cpp \
    clients.cpp \
    membersmodel.cpp \
    members.cpp \
    clothesmodel.cpp \
    clothes.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    ingredientsmodel.h \
    message.h \
    clientsmodel.h \
    clients.h \
    membersmodel.h \
    members.h \
    clothesmodel.h \
    clothes.h

DISTFILES += \
    ../Downloads/back.png
