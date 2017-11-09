#include "clothesmodel.h"

// insert an item into a database
void ClothesModel::insertItem (QString id, QString name,QString brand, QString imgPath,QString description,QString size,std::vector<QString> colors, std::vector<std::pair<QString,double>> components,QString price)
{
    beginResetModel();

    Clothes *c;
    c = new Clothes(id,name,brand,imgPath,description,size,colors,components,price);

    qDebug ("object created\n");
    this->myData.push_back(*c);
    endResetModel();

    qDebug("Size of Items vector is now %d\n",myData.size());
}

//deletes an item from database according to it's unique id
void ClothesModel::deleteItem(QString id){
    int k=0;
    beginResetModel();
    for (unsigned long j=0;j<myData.size();j++)
    {
            if ( ((Clothes)myData[j]).getId()==id)
            {
               break;
            }
            k++;
    }
    myData.erase(myData.begin() + k);
    endResetModel();
}

//changes item's info
void ClothesModel::changeItem1 (QString id,QString name,QString brand, QString imgPath,QString description,QString size,QString price)
{
    beginResetModel();
    for (unsigned long j=0;j<myData.size();j++)
    {
            if ( ((Clothes)myData[j]).getId()==id)
            {
                beginResetModel();
                int id = rand() % 10000000 + 1;
                QString id2 = QString::number(id);
                Clothes *c;
                c = new Clothes(id2,name,brand,imgPath,description,size,((Clothes)myData[j]).getColors(),((Clothes)myData[j]).getComponents(),price);
                qDebug ("object changed\n");
                this->myData.push_back(*c);
                endResetModel();
                break;
            }
    }
}

void ClothesModel::changeItem2 (QString id,QString name,QString brand, QString imgPath,QString description,QString size,std::vector<QString> colors,QString price)
{
    beginResetModel();
    for (unsigned long j=0;j<myData.size();j++)
    {
            if ( ((Clothes)myData[j]).getId()==id)
            {
                beginResetModel();
                int id = rand() % 10000000 + 1;
                QString id2 = QString::number(id);
                Clothes *c;
                c = new Clothes(id2,name,brand,imgPath,description,size,colors,((Clothes)myData[j]).getComponents(),price);
                qDebug ("object changed\n");
                this->myData.push_back(*c);
                endResetModel();
                break;
            }
    }
}

void ClothesModel::changeItem3 (QString id,QString name,QString brand, QString imgPath,QString description,QString size,std::vector<std::pair<QString,double>> components,QString price)
{
    beginResetModel();
    for (unsigned long j=0;j<myData.size();j++)
    {
            if ( ((Clothes)myData[j]).getId()==id)
            {
                beginResetModel();
                int id = rand() % 10000000 + 1;
                QString id2 = QString::number(id);
                Clothes *c;
                c = new Clothes(id2,name,brand,imgPath,description,size,((Clothes)myData[j]).getColors(),components,price);
                qDebug ("object changed\n");
                this->myData.push_back(*c);
                endResetModel();
                break;
            }
    }
}

QHash<int, QByteArray> ClothesModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[NameRole] = "name";
    roles[BrandRole] = "brand";
    roles[ImgPathRole] = "image";
    roles[DescriptionRole] = "description";
    roles[SizeRole] = "size";
    roles[ColorsRole] = "colors";
    roles[MaterialsRole] = "materials";
    roles[PriceRole] = "price";
    return roles;
}

int ClothesModel::rowCount(const QModelIndex &parent) const
{
    return myData.size();
}

QVariant ClothesModel::data(const QModelIndex &index, int role) const
{
    int row = index.row();
    if (myData.size()>row && row>=0)
    {
        Clothes i = myData[row];
        switch (role)
        {
            case IdRole: return i.getId();
            case NameRole: return i.getName();
            case BrandRole: return i.getBrand();
            case ImgPathRole: return i.getImgPath();
            case DescriptionRole: return i.getDescription();
            case SizeRole: return i.getSize();
            case ColorsRole: return i.getColorSimple();
            case MaterialsRole: return i.getComponentsSimple();
            case PriceRole: return i.getPrice();
            default: return QVariant();
        }
    }
    else
    {
        QVariant qv;
        return qv;
    }
}
