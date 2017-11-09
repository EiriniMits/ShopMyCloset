#ifndef MEMBERS_H
#define MEMBERS_H
#include <QObject>

class Members
{
    private:
        QString name;
        QString lastname;
        QString email;
        QString password;

    public:
        Members(QString name,QString lastname,QString email, QString password);
        QString getName () const{return name;}
        QString getLastName () const{return lastname;}
        QString getEmail () const{return email;}
        QString getPassword () const {return password;}
};

#endif // MEMBERS_H
