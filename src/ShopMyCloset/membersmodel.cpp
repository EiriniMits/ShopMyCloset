#include "membersmodel.h"

// insert sigh up info into a database
void MembersModel::insertUser (QString name,QString lastname,QString email,QString password )
{
    beginResetModel();
    Members a(name,lastname,email,password);
    this->myData.push_back(a);
    endResetModel();

    qDebug("Size of Users vector is now %d\n",myData.size());
}

//find out if the person that log in is the admin, a user or none of these two
int MembersModel::find (QString email,QString password )
{

    std::string str = "admin@yahoo.com";
    QString name1 = QString::fromStdString(str);
    std::string str2 = "admin";
    QString password1 = QString::fromStdString(str2);
    if ( QString::compare(email, name1, Qt::CaseInsensitive)==0 && QString::compare(password, password1, Qt::CaseInsensitive)==0)
    {
        qDebug("administrator\n");
         return 2;
    }
    else{
        for (unsigned long j=0;j<myData.size();j++)
        {
                if ( ((Members)myData[j]).getEmail()==email && ((Members)myData[j]).getPassword() == password)
                {
                    qDebug("user\n");
                   return 1;
                }
        }
    }
    return 0;
}

//find out if this email is taken by another user or admin (in case someone writes a fake email)
int MembersModel::find2 (QString email)
{
    std::string str = "admin@yahoo.com";
    QString name1 = QString::fromStdString(str);
    if ( QString::compare(email, name1, Qt::CaseInsensitive)==0 )
    {
         return 1;
    }
    else{
        for (unsigned long j=0;j<myData.size();j++)
        {
                if ( ((Members)myData[j]).getEmail()==email)
                {
                    return 1;
                }
        }
    }
    return 0;
}

//returns the first name of a member according to his email
QString MembersModel::getname(QString email){
    for (unsigned long j=0;j<myData.size();j++)
    {
            if ( ((Members)myData[j]).getEmail()==email)
            {
                return ((Members)myData[j]).getName();
            }
    }
}

//returns the last name of a member according to his email
QString MembersModel::getlastname(QString email){
    for (unsigned long j=0;j<myData.size();j++)
    {
            if ( ((Members)myData[j]).getEmail()==email)
            {
                return ((Members)myData[j]).getLastName();
            }
    }
}

QHash<int, QByteArray> MembersModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[LastNameRole] = "lastname";
    roles[EmailRole] = "email";
    roles[PasswordRole] = "password";

    return roles;
}

int MembersModel::rowCount(const QModelIndex &parent) const
{
    return myData.size();
}

QVariant MembersModel::data(const QModelIndex &index, int role) const
{
    int row = index.row();
    if (myData.size()>row && row>=0)
    {
        Members i = myData[row];
        switch (role)
        {
            case NameRole: return i.getName();
            case LastNameRole: return i.getLastName();
            case EmailRole: return i.getEmail();
            case PasswordRole: return i.getPassword();

        default: return QVariant();
        }
    }
    else
    {
        QVariant qv;
        return qv;
    }
}
