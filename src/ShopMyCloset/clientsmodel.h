#ifndef CLIENTSMODEL_H
#define CLIENTSMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include "clients.h"

class ClientsModel: public QAbstractListModel
{
    Q_OBJECT

    public:
        enum ClientsRoles {
            NameRole = Qt::UserRole + 1,
            SecondNameRole, ImgPathRole,CountryRole,CityRole, AddressRole, ZipRole,TelephoneRole,PriceRole,DateRole
        };

        void insertClient(QString name,QString name2, QString imgPath,QString country,QString city,QString address,QString zip,QString tel,QString price,QString date);
        QHash<int, QByteArray> roleNames() const;
        int rowCount(const QModelIndex &parent = QModelIndex()) const;
        QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;

    private:
         std::vector <Clients> myData;
};

#endif // CLIENTSMODEL_H
