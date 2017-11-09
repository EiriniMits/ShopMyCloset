#include "message.h"
#include<QDateTime>
#include<QDebug>

Message::Message(QObject *parent) : QObject(parent)
{
    _membersModel = new MembersModel();
    _clothesModel = new ClothesModel();
    _clientsModel  = new ClientsModel();

    QString description1,description2,description3,description4,description5;
    description1="V-neck playsuit in a viscose weave with narrow adjustable shoulder straps, bare shoulders, short frilled sleeves, an elasticated seam at the waist and side pockets.";
    description2="Sleeveless blouse in a viscose weave with a lace Peter Pan collar with a sewn-on tie at the neck, an opening with two buttons at the back of the neck, a seam at the top and gentle flare to the hem.";
    description3="V-neck playsuit in airy, crinkled viscose with narrow, adjustable shoulder straps, a concealed zip at the back, inset lace trim at the waist and short, wide legs. Jersey lining.";
    description4="Short, off-the-shoulder dress in a crêpe weave with narrow adjustable shoulder straps, 3/4-length sleeves, smocking at the waist and a flounce at the cuffs and hem. Lined.";
    description5="Short, off-the-shoulder blouse in chiffon crêpe with smocking at the top, 3/4-length trumpet sleeves and a smocked hem.";

    QVariantList colors1,colors2,colors3,colors4,colors5;
    colors1.append("White");
    colors1.append("Purple");
    colors1.append("Orange");
    colors1.append("Black");
    colors1.append("Pink");

    colors2.append("Beige");

    colors3.append("Black");

    colors4.append("White");
    colors4.append("Green");

    colors5.append("White");
    colors5.append("Pink");
    colors5.append("Purple");

    QVariantList material1,material2,material3,material4,material5;
    material1.append("Viscose");
    material2.append("Cotton");
    material3.append("Viscose");
    material4.append("Polyester");
    material4.append("Elastane");
    material5.append("Polyester");

    QVariantList per1,per2,per3,per4,per5;
    per1.append(100);
    per2.append(100);
    per3.append(100);
    per4.append(97);
    per4.append(3);
    per5.append(100);

    insertItem("Boho blouse","H&M","images/images/hmprod-3.jpeg",description5,"L",colors5,material5,per5,"10.99");
    insertItem("Cold shoulder playsuit","H&M","images/images/hmprod-4.jpeg",description1,"S",colors1,material1,per1,"12.99");
    insertItem("Off-the-shoulder dress","Pull and Bear","images/images/hmprod-2.jpeg",description4,"S",colors4,material4,per4,"14.99");
    insertItem("Sleeveless playsuit","Berska","images/images/hmprod-1.jpeg",description3,"S",colors3,material3,per3,"12.99");
    insertItem("Blouse with a lace collar","Stradivarious","images/images/hmprod.jpeg",description2,"M",colors2,material2,per2,"10.99");

    signupUser("Eirini","Mitsopoulou","user@yahoo.com","user");

    insertClient("Eirini","Mitsopoulou","images/images/hmprod-5.jpeg","Greece","Athens","Patission St. 34, First Floor","87654","+30690909009","14.99");
}

void Message::insertItem(QString name, QString brand, QString imgPath,QString desc, QString size, QVariantList c, QVariantList m, QVariantList p,QString price)
{
    std::vector<QString> colors;
    std::vector<QString> materials;
    std::vector<double> per;

    for (int i=0;i<c.size();i++)
        colors.push_back(c[i].toString());
    for (int i=0;i<m.size();i++)
        materials.push_back(m[i].toString());
    for (int i=0;i<p.size();i++)
        per.push_back(p[i].toDouble());

    std::vector<std::pair<QString,double>> components;

    for (unsigned long i=0;i<materials.size();i++)
    {

        for (unsigned long j=0;j<materials.size();j++)
        {
                std::pair<QString,double> p(materials[i],per[i]);
                components.push_back(p);
                break;
        }
    }
    int id = rand() % 10000000 + 1;
    QString id2 = QString::number(id);
    qDebug() << id2;

    _clothesModel->insertItem(id2,name,brand,imgPath,desc,size,colors,components,price);
}

void Message::deleteItem(QString id){

    _clothesModel->deleteItem(id);
}

void Message::changeItem1 (QString id, QString name,QString brand, QString imgPath,QString description,QString size,QString price){

    _clothesModel->changeItem1(id,name,brand,imgPath,description,size,price);
}

void Message::changeItem2 (QString id, QString name,QString brand, QString imgPath,QString description,QString size,QVariantList c,QString price){

    std::vector<QString> colors;

    for (int i=0;i<c.size();i++)
        colors.push_back(c[i].toString());

    _clothesModel->changeItem2(id,name,brand,imgPath,description,size,colors,price);
}

void Message::changeItem3 (QString id, QString name,QString brand, QString imgPath,QString description,QString size,QVariantList m, QVariantList p,QString price){

    std::vector<QString> materials;
    std::vector<double> per;
    std::vector<std::pair<QString,double>> components;

    for (int i=0;i<m.size();i++)
        materials.push_back(m[i].toString());
    for (int i=0;i<p.size();i++)
        per.push_back(p[i].toDouble());

    for (unsigned long i=0;i<materials.size();i++)
    {

        for (unsigned long j=0;j<materials.size();j++)
        {
                std::pair<QString,double> p(materials[i],per[i]);
                components.push_back(p);
                break;
        }
    }

    _clothesModel->changeItem3(id,name,brand,imgPath,description,size,components,price);
}

int Message::loginUser (QString email, QString password)
{
    return _membersModel->find(email, password);
}

QString Message::getname(QString email)
{
     return _membersModel->getname(email);
}

QString Message::getlastname(QString email)
{
     return _membersModel->getlastname(email);
}

int Message::signupUser (QString name,QString lastname,QString email, QString password)
{
    int b;
    b= _membersModel->find2(email);
    if(b==0){
        _membersModel->insertUser(name,lastname,email, password);
        emit membersModelChanged();
    }
    return b;
}

//check if all the sign up fields are filed in
int Message::check (QString name,QString lastname, QString email ,QString password)
{
     QString blank = QString::fromStdString("");
    if(name==blank || lastname==blank || email==blank ||password==blank )
        return 0;
    return 1;
}

void Message::insertClient(QString name,QString name2, QString imgPath,QString country,QString city,QString address,QString zip,QString tel,QString price){
    QDateTime dateTime = dateTime.currentDateTime();
    QString dateTimeString = dateTime.toString("dd/MM/yyyy      hh:mm"); //gets the exact date and time of the order
    _clientsModel->insertClient(name,name2,imgPath,country,city,address,zip,tel,price,dateTimeString);
}

//check if all the fields of the order form are filed in
int Message::check2 (QString name,QString name2,QString country,QString city,QString address,QString zip,QString tel)
{
     QString blank = QString::fromStdString("");
    if(name==blank || name2==blank || country==blank ||city==blank ||address==blank ||zip==blank ||tel==blank)
        return 0;
    return 1;
}
