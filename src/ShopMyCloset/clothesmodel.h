#ifndef CLOTHESMODEL_H
#define CLOTHESMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include "clothes.h"

class ClothesModel : public QAbstractListModel
{
    Q_OBJECT

    public:
        enum ClothesRoles {
             IdRole = Qt::UserRole + 1,
             NameRole, BrandRole, ImgPathRole,DescriptionRole,SizeRole, ColorsRole, MaterialsRole,PriceRole
        };

        void insertItem(QString id, QString name,QString brand, QString imgPath,QString description,QString size,std::vector<QString> colors,std::vector<std::pair<QString,double>> components,QString price);
        void deleteItem(QString id);
        void changeItem1 (QString id,QString name,QString brand, QString imgPath,QString description,QString size,QString price);
        void changeItem2 (QString id,QString name,QString brand, QString imgPath,QString description,QString size,std::vector<QString> colors,QString price);
        void changeItem3 (QString id,QString name,QString brand, QString imgPath,QString description,QString size,std::vector<std::pair<QString,double>> components,QString price);
        QHash<int, QByteArray> roleNames() const;
        int rowCount(const QModelIndex &parent = QModelIndex()) const;
        QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;

    private:
       std:: vector <Clothes> myData;
};

#endif // CLOTHESMODEL_H
