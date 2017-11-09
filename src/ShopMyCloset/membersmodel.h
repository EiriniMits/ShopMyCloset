#ifndef MEMBERSMODEL_H
#define MEMBERSMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include "members.h"


class MembersModel : public QAbstractListModel
{
    Q_OBJECT

    public:
        enum MembersRoles {
            NameRole = Qt::UserRole + 1,
            LastNameRole,EmailRole,PasswordRole
        };

        void insertUser (QString name,QString lastname,QString email, QString password);
        int find(QString email,QString password);
        int find2(QString email);
        QString getname(QString email);
        QString getlastname(QString email);
        int rowCount(const QModelIndex &parent = QModelIndex()) const;
        QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
        QHash<int, QByteArray> roleNames() const;

    private:
       std:: vector <Members> myData;
};

#endif // MEMBERSMODEL_H
