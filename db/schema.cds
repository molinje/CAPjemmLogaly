namespace com.molinje;

using {
    cuid,
    managed,
    sap.common.CodeList,
    sap.common.Currencies,
    sap.common.Countries,


} from '@sap/cds/common';

entity Sales : cuid, managed {
    cod_saleid   : String(12);
    email        : String(30);
    firstname    : String(30);
    lastname     : String(30);
    country      : Association to Countries; // country --- country_code
    createon     : cds.Date;
    deliverydate : cds.Date;
    statu        : Association to Status; //statu --- statu_code
    imageurl     : String(30);
    image         : LargeBinary @Core.MediaType: imageType @UI.IsImage;
    imageType     : String      @Core.IsMediaType;
    toSaleItems : Composition of many SaleItems
                        on toSaleItems.saleid = $self;

};

entity SaleItems : cuid {

    saleid           : Association to Sales;
    name             : String(40);
    description      : String(40);
    releasedate      : cds.Date;
    discontinueddate : cds.Date;
    price            : Decimal(12, 2);
    currency         : Association to Currencies; //currency --- currency_code
    height           : Decimal(6, 2);
    width            : Decimal(6, 2);
    depth            : Decimal(6, 2);
    quantity         : Decimal(16, 2);
    //unitofmeasure    : String(4);
    unitofmeasure :   Association to Measurements; //unitofmeasure --- unitofmeasure_code
    unitVolume :  Association to Measurements; //unitofmeasure --- unitVolume_code
   

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

entity Measurements : CodeList {
    key code        : String(12) enum {
            BAG = 'Bag';
            BOT = 'Bottle';
            BU = 'Bushel';
        };
};
