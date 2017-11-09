/****************************************************************************
** Meta object code from reading C++ file 'message.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.6.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "message.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'message.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.6.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_Message_t {
    QByteArrayData data[26];
    char stringdata0[215];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Message_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Message_t qt_meta_stringdata_Message = {
    {
QT_MOC_LITERAL(0, 0, 7), // "Message"
QT_MOC_LITERAL(1, 8, 12), // "modelChanged"
QT_MOC_LITERAL(2, 21, 0), // ""
QT_MOC_LITERAL(3, 22, 16), // "dishModelChanged"
QT_MOC_LITERAL(4, 39, 9), // "loginUser"
QT_MOC_LITERAL(5, 49, 4), // "name"
QT_MOC_LITERAL(6, 54, 8), // "password"
QT_MOC_LITERAL(7, 63, 10), // "signupUser"
QT_MOC_LITERAL(8, 74, 5), // "check"
QT_MOC_LITERAL(9, 80, 8), // "lastname"
QT_MOC_LITERAL(10, 89, 5), // "email"
QT_MOC_LITERAL(11, 95, 10), // "insertItem"
QT_MOC_LITERAL(12, 106, 5), // "brand"
QT_MOC_LITERAL(13, 112, 7), // "imgPath"
QT_MOC_LITERAL(14, 120, 4), // "desc"
QT_MOC_LITERAL(15, 125, 4), // "size"
QT_MOC_LITERAL(16, 130, 1), // "c"
QT_MOC_LITERAL(17, 132, 1), // "m"
QT_MOC_LITERAL(18, 134, 1), // "p"
QT_MOC_LITERAL(19, 136, 5), // "price"
QT_MOC_LITERAL(20, 142, 10), // "deleteItem"
QT_MOC_LITERAL(21, 153, 4), // "test"
QT_MOC_LITERAL(22, 158, 15), // "ingredientModel"
QT_MOC_LITERAL(23, 174, 17), // "IngredientsModel*"
QT_MOC_LITERAL(24, 192, 11), // "dishesModel"
QT_MOC_LITERAL(25, 204, 10) // "dishModel*"

    },
    "Message\0modelChanged\0\0dishModelChanged\0"
    "loginUser\0name\0password\0signupUser\0"
    "check\0lastname\0email\0insertItem\0brand\0"
    "imgPath\0desc\0size\0c\0m\0p\0price\0deleteItem\0"
    "test\0ingredientModel\0IngredientsModel*\0"
    "dishesModel\0dishModel*"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Message[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       2,   98, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   54,    2, 0x06 /* Public */,
       3,    0,   55,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       4,    2,   56,    2, 0x0a /* Public */,
       7,    2,   61,    2, 0x0a /* Public */,
       8,    4,   66,    2, 0x0a /* Public */,
      11,    9,   75,    2, 0x0a /* Public */,
      20,    1,   94,    2, 0x0a /* Public */,
      21,    0,   97,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Int, QMetaType::QString, QMetaType::QString,    5,    6,
    QMetaType::Int, QMetaType::QString, QMetaType::QString,    5,    6,
    QMetaType::Int, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString,    5,    9,   10,    6,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QVariantList, QMetaType::QVariantList, QMetaType::QVariantList, QMetaType::QString,    5,   12,   13,   14,   15,   16,   17,   18,   19,
    QMetaType::Void, QMetaType::QString,    5,
    QMetaType::Void,

 // properties: name, type, flags
      22, 0x80000000 | 23, 0x0049500b,
      24, 0x80000000 | 25, 0x0049510b,

 // properties: notify_signal_id
       0,
       1,

       0        // eod
};

void Message::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Message *_t = static_cast<Message *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->modelChanged(); break;
        case 1: _t->dishModelChanged(); break;
        case 2: { int _r = _t->loginUser((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 3: { int _r = _t->signupUser((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 4: { int _r = _t->check((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3])),(*reinterpret_cast< QString(*)>(_a[4])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 5: _t->insertItem((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3])),(*reinterpret_cast< QString(*)>(_a[4])),(*reinterpret_cast< QString(*)>(_a[5])),(*reinterpret_cast< QVariantList(*)>(_a[6])),(*reinterpret_cast< QVariantList(*)>(_a[7])),(*reinterpret_cast< QVariantList(*)>(_a[8])),(*reinterpret_cast< QString(*)>(_a[9]))); break;
        case 6: _t->deleteItem((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 7: _t->test(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (Message::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&Message::modelChanged)) {
                *result = 0;
                return;
            }
        }
        {
            typedef void (Message::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&Message::dishModelChanged)) {
                *result = 1;
                return;
            }
        }
    } else if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 0:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< IngredientsModel* >(); break;
        case 1:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< dishModel* >(); break;
        }
    }

#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        Message *_t = static_cast<Message *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< IngredientsModel**>(_v) = _t->ingredientModel(); break;
        case 1: *reinterpret_cast< dishModel**>(_v) = _t->dishesModel(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        Message *_t = static_cast<Message *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setModel(*reinterpret_cast< IngredientsModel**>(_v)); break;
        case 1: _t->setDishesModel(*reinterpret_cast< dishModel**>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject Message::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Message.data,
      qt_meta_data_Message,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *Message::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Message::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_Message.stringdata0))
        return static_cast<void*>(const_cast< Message*>(this));
    return QObject::qt_metacast(_clname);
}

int Message::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 8)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 8;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 2;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void Message::modelChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, Q_NULLPTR);
}

// SIGNAL 1
void Message::dishModelChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, Q_NULLPTR);
}
QT_END_MOC_NAMESPACE
