#ifndef MESSAGE_H
#define MESSAGE_H
#include <QObject>
#include "membersmodel.h"
#include "clothesmodel.h"
#include "clientsmodel.h"

class Message : public QObject
{

    Q_OBJECT
    Q_PROPERTY(MembersModel* membersModel READ membersModel WRITE setMembersModel NOTIFY membersModelChanged)
    Q_PROPERTY(ClothesModel* clothesModel READ clothesModel WRITE setClothesModel NOTIFY clothesModelChanged)
    Q_PROPERTY(ClientsModel* clientsModel READ clientsModel WRITE setClientsModel NOTIFY clientsModelChanged)

    public:
         Message(QObject *parent=0);
         void setMembersModel(MembersModel* m)
         {
             _membersModel = m;
             emit membersModelChanged();
         }
         void setClothesModel (ClothesModel* m)
         {
             _clothesModel= m;
             emit clothesModelChanged();
         }
         void setClientsModel (ClientsModel* m)
         {
             _clientsModel= m;
             emit clientsModelChanged();
         }

         MembersModel* membersModel()
         {
             return _membersModel;
         }
         ClothesModel* clothesModel()
         {
             return _clothesModel;
         }

         ClientsModel* clientsModel()
         {
             return _clientsModel;
         }


    private:
        MembersModel *_membersModel;
        ClothesModel *_clothesModel;
        ClientsModel *_clientsModel;


    signals:
        void membersModelChanged();
        void clothesModelChanged();
        void clientsModelChanged();

    public slots:
        void insertItem(QString name, QString brand, QString imgPath,QString desc, QString size, QVariantList c, QVariantList m, QVariantList p,QString price);
        void deleteItem(QString id);
        void changeItem1 (QString id,QString name,QString brand, QString imgPath,QString description,QString size,QString price);
        void changeItem2 (QString id,QString name,QString brand, QString imgPath,QString description,QString size,QVariantList c,QString price);
        void changeItem3 (QString id,QString name,QString brand, QString imgPath,QString description,QString size,QVariantList m, QVariantList p,QString price);
        int loginUser (QString email, QString password);
        QString getname(QString email);
        QString getlastname(QString email);
        int signupUser (QString name,QString lastname,QString email, QString password);
        int check (QString name,QString lastname, QString email ,QString password);
        void insertClient(QString name,QString name2, QString imgPath,QString country,QString city,QString address,QString zip,QString tel,QString price);
        int check2 (QString name,QString name2,QString country,QString city,QString address,QString zip,QString tel);
        void test(){}
};

#endif // MESSAGE_H

