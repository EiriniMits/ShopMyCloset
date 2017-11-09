#include "clientsmodel.h"
#include<QDateTime>
#include<QDebug>

//insert client's and order's info into a database
void ClientsModel::insertClient(QString name,QString name2, QString imgPath,QString country,QString city,QString address,QString zip,QString tel,QString price,QString date)
{
    beginResetModel();
    qDebug() << date;
    Clients *c;
    c = new Clients(name,name2,imgPath,country,city,address,zip,tel,price,date);

    this->myData.push_back(*c);
    endResetModel();
    qDebug("Size of Clients vector is now %d\n",myData.size());
}

QHash<int, QByteArray> ClientsModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[SecondNameRole] = "name2";
    roles[ImgPathRole] = "image";
    roles[CountryRole] = "country";
    roles[CityRole] = "city";
    roles[AddressRole] = "address";
    roles[ZipRole] = "zip";
    roles[TelephoneRole] = "telephone";
    roles[PriceRole] = "price";
    roles[DateRole] = "date";

    return roles;
}

int ClientsModel::rowCount(const QModelIndex &parent) const
{
    return myData.size();
}

QVariant ClientsModel::data(const QModelIndex &index, int role) const
{
    int row = index.row();
    if (myData.size()>row && row>=0)
    {
        Clients i = myData[row];
        switch (role)
        {
        case NameRole: return i.getName();
        case SecondNameRole: return i.getName2();
        case ImgPathRole: return i.getImgPath();
        case CountryRole: return i.getCountry();
        case CityRole: return i.getCity();
        case AddressRole: return i.getAddress();
        case ZipRole: return i.getZip();
        case TelephoneRole: return i.getTel();
        case PriceRole: return i.getPrice();
        case DateRole: return i.getDate();
        default: return QVariant();
        }
    }
    else
    {
        QVariant qv;
        return qv;
    }
}
