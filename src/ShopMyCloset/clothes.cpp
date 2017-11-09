#include "clothes.h"
#include <cmath>

Clothes::Clothes(QString id,QString name,QString brand, QString imgPath,QString description,QString size,std::vector<QString> colors, std::vector<std::pair<QString,double>> components,QString price)
{
    this->id=id;
    this->name=name;
    this->brand=brand;
    this->imgPath=imgPath;
    this->description=description;
    this->size=size;
    this->colors=colors;
    this->components=components;
    this->price=price;
}

QString Clothes::getColorSimple()
{
    QString s;
    s="";
    for (int i =0;i<colors.size();i++)
    {
        s+= "• "+colors[i]+"\n\n";

    }
    return s;
}

QString Clothes::getComponentsSimple()
{
    QString s;
    s="";
    double k;
    QString p;
    for (int i =0;i<components.size();i++)
    {
        p = components[i].first;
        k = components[i].second;

        s+="• "+p;
        s+="  "+QString::fromStdString(std::to_string((int) round(k)))+"%\n\n";
    }
    return s;
}
