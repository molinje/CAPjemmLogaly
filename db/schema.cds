namespace com.molinje;

using {
    cuid,
    managed,
    sap.common.CodeList,
    sap.common.Currencies,
    sap.common.Countries,

} from '@sap/cds/common';

entity Sales : cuid, managed {

    email        : String(30);
    firstname    : String(30);
    lastname     : String(30);
    country      : Association to Countries; // country --- country_code
    createon     : cds.Date;
    deliverydate : cds.Date;
    statu        : Association to Status; //statu --- statu_code
    imageurl     : String(30);

};

entity SaleItems : cuid {

    saleid           : Association to Sales;
    name             : String(40);
    description      : String(40);
    releasedate      : cds.Date;
    discontinueddate : cds.Date;
    price            : Decimal(12, 2);
    currency         : Association to Currencies; //currency --- currency_code
    height           : Decimal(15, 3);
    width            : Decimal(15, 3);
    depth            : Decimal(12, 2);
    quantity         : Decimal(16, 2);
    unitofmeasure    : String(4);

}

/** Code List */

entity Status : CodeList {
    key code        : String(20) enum {
            InStock = 'In Stock';
            OutOfStock = 'Out of Stock';
            LowAvailability = 'Low Availabilit';
        };
        criticality : Integer;
};
