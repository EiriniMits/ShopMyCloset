#ifndef CLIENTS_H
#define CLIENTS_H

#include <QObject>

class Clients
{
    QString name;
    QString name2;
    QString imgPath;
    QString country;
    QString city;
    QString address;
    QString zip;
    QString tel;
    QString price;
    QString date;

    public:
        Clients(QString name,QString name2, QString imgPath,QString country,QString city,QString address,QString zip,QString tel,QString price,QString date);
        QString getName(){return name;}
        QString getName2(){return name2;}
        QString getImgPath(){return imgPath;}
        QString getCountry(){return country;}
        QString getCity(){return city;}
        QString getAddress(){return address;}
        QString getZip(){return zip;}
        QString getTel(){return tel;}
        QString getPrice(){return price;}
        QString getDate(){return date;}
};

#endif // CLIENTS_H
