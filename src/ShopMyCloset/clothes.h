#ifndef CLOTHES_H
#define CLOTHES_H
#include <QObject>

class Clothes
{
    private:
        QString id;
        QString name;
        QString brand;
        QString imgPath;
        QString description;
        QString size;
        std::vector<QString> colors;
        std::vector<std::pair<QString,double>> components;
        QString price;

    public:
        Clothes(QString id, QString name,QString brand, QString imgPath,QString description,QString size,std::vector<QString> colors, std::vector<std::pair<QString,double>> components,QString price);
        QString getId(){return id;}
        QString getName(){return name;}
        QString getBrand(){return brand;}
        QString getImgPath(){return imgPath;}
        QString getDescription(){return description;}
        QString getSize(){return size;}
        std::vector<QString> getColors(){return colors;}
        std::vector<std::pair<QString,double>> getComponents(){return components;}
        QString getPrice(){return price;}
        QString getComponentsSimple();
        QString getColorSimple();
};

#endif // CLOTHES_H
