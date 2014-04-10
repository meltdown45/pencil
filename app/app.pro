
QT += core widgets gui xml multimedia svg

CONFIG += c++11
TEMPLATE = app
TARGET = Pencil2D

INCLUDEPATH += \
    ../pencil/graphics \
    ../pencil/graphics/bitmap \
    ../pencil/graphics/vector \
    ../pencil/interface \
    ../pencil/structure \
    ../pencil/tool \
    ../pencil/util \
    ../pencil/ui \
    ../pencil/managers

RESOURCES += ../pencil.qrc

SOURCES += main.cpp

macx {
    QMAKE_CXXFLAGS += -std=c++11 -stdlib=libc++
    LIBS += -lobjc -lz -framework AppKit -framework Carbon
}

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../pencil/release/ -lpencil
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../pencil/debug/ -lpencil
else:unix: LIBS += -L$$OUT_PWD/../pencil/ -lpencil

INCLUDEPATH += $$PWD/../pencil
DEPENDPATH += $$PWD/../pencil

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../pencil/release/libpencil.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../pencil/debug/libpencil.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../pencil/release/pencil.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../pencil/debug/pencil.lib
else:unix: PRE_TARGETDEPS += $$OUT_PWD/../pencil/libpencil.a