using {molinje as service} from '../service';

annotate service.SaleItems with {

    name             @title            : 'Product Name';
    description      @title            : 'Description';
    releasedate      @title            : 'Release Date';
    discontinueddate @title            : 'Discontinued Date';
    currency         @Common.IsCurrency: true;
    height           @title            : 'Height' @Measures.Unit: unitVolume_code @Common.FieldControl: #ReadOnly;
    width            @title            : 'Width' @Measures.Unit: unitVolume_code;
    depth            @title            : 'Depth' @Measures.Unit: unitVolume_code;
    quantity         @title: 'Quantity'  @Measures.Unit       : unitofmeasure_code @Common.FieldControl: #ReadOnly;
    price            @title: 'Price'     @Measures.ISOCurrency: currency_code;
    unitofmeasure    @title            : 'Unit of Measure';
    unitVolume       @title            : 'Unit Volume' @Common.IsUnit: true;

};

annotate service.SaleItems with @(

    UI.HeaderInfo: {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Item',
        TypeNamePlural: 'Items',
        Title         : {
            $Type: 'UI.DataField',
            Value: name
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: description
        }
    },
    UI.LineItem  : [

        {
            $Type: 'UI.DataField',
            Value: name
        },
      
        {
            $Type: 'UI.DataField',
            Value: quantity
        },

        {
            $Type: 'UI.DataField',
            Value: price
        },


    ],

    UI.FieldGroup #ItemData: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: name,
            },
            {
                $Type: 'UI.DataField',
                Value: description,
            },
            {
                $Type: 'UI.DataField',
                Value: releasedate,
            },
            {
                $Type: 'UI.DataField',
                Value: discontinueddate,
            },

             {
                $Type: 'UI.DataField',
                Value: price,
            },
 
            {
                $Type: 'UI.DataField',
                Value: height,
            },
            {
                $Type: 'UI.DataField',
                Value: width,
            },
            {
                $Type: 'UI.DataField',
                Value: depth,
            },
            

           
        ],
        Label: 'Item Data'
    },
     UI.Facets         : [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#ItemData',
        Label : 'Item Data',
        ID    : 'ItemData'
    }]


);
