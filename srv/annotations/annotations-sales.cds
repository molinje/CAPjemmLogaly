using {molinje as service} from '../service';


// Activar Draft para la entidad Sales
// esto permite que se pueda crear un borrador de una venta
// y luego se pueda publicar o cancelar el borrador
annotate service.Sales with @odata.draft.enabled;

annotate service.Sales with {

    cod_saleid   @title: 'Sale Number'  @Common.FieldControl: #ReadOnly;
    email        @title: 'Email';
    firstname    @title: 'First Name';
    lastname     @title: 'Last Name';
    createdAt    @title: 'created At';
    createdBy    @title: 'created By';
    modifiedAt   @title: 'modified At';
    modifiedBy   @title: 'modified By';
    country      @title: 'Country';
    createon     @title: 'Create on' @Common.FieldControl: #ReadOnly;
    deliverydate @title: 'Delivery Date' @Common.FieldControl: #ReadOnly;
    statu        @title: 'Status';
    imageurl     @title: 'Image';
    image        @title: 'Image';

};

// Anotaciones para los campos de la entidad Sales
annotate service.Sales with {
    // Annotation para el campo statu, esta annotation es para mostrar el nombre del estado en lugar del ID
    statu   @Common: {
        Text           : statu.name,
        TextArrangement: #TextOnly,
    };

    // Annotation para el campo Country  para mostrar el nombre del Pais en lugar del ID
    country @Common: {
        Text           : country.name,
        TextArrangement: #TextOnly,
    };

};

annotate service.Sales with @(


    // Cabecera del Listado
    UI.HeaderInfo                 : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Sale',
        TypeNamePlural: 'Sales',
        // Titulo y descripción de la pagina a la que se navega cuando
        // se pasa a navegar a un objeto o item del listado
        Title         : {
            $Type: 'UI.DataField',
            Value: cod_saleid
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: email
        }
    },

    //   Filtros del reporte
    UI.SelectionFields            : [
        cod_saleid,
        createon,
        deliverydate,
        email,
        firstname,
        lastname,
        country

    ],

    // Campos que se muestran en el listado de ventas
    UI.LineItem                   : [
        {
            $Type: 'UI.DataField',
            Value: image,

        },
        {
            $Type                : 'UI.DataField',
            Value                : cod_saleid,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '8rem',
            },
        },

        {
            $Type                : 'UI.DataField',
            Value                : firstname,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '8rem',
            },
        },
        {
            $Type                : 'UI.DataField',
            Value                : lastname,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '8rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: createon,
            Label: 'Create on'
        },
        {
            $Type: 'UI.DataField',
            Value: deliverydate,
            Label: 'Delivery Date'
        }
    ],


    // Grupo de campos para la cabecera del objeto al cual se nvegará
    // cuando se seleccione un item del listado
    UI.FieldGroup #SaleData       : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: firstname
            },

            {
                $Type: 'UI.DataField',
                Value: lastname
            },


        ]
    },

    UI.FieldGroup #Image          : {
        $Type: 'UI.FieldGroupType',
        Data : [{
            $Type: 'UI.DataField',
            Value: image,
            Label: ''
        }]
    },

    // Grupo de campos para la cabecera del objeto al cual se nvegará
    // cuando se seleccione un item del listado
    UI.FieldGroup #SaleDates      : {
        $Type: 'UI.FieldGroupType',
        Data : [


            {
                $Type: 'UI.DataField',
                Value: createon
            },
            {
                $Type: 'UI.DataField',
                Value: deliverydate
            }


        ]
    },

    // Grupo de campos para la cabecera del objeto al cual se nvegará
    // cuando se seleccione un item del listado
    UI.FieldGroup #CountryandStatu: {
        $Type: 'UI.FieldGroupType',
        Data : [


            {
                $Type: 'UI.DataField',
                Value: country_code
            },
            {
                $Type: 'UI.DataField',
                Value: statu_code
            }


        ]
    },

    // HeaderFacets imprimime los grupos de campos en la cabecera del objeto al cual se nvegará
    UI.HeaderFacets               : [

        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#Image',
            ID    : 'Image'
        },

        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#SaleData',
            ID    : 'SaleData'

        }

        ,
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#SaleDates',
            ID    : 'SaleDates'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#CountryandStatu',
            ID    : 'CountryandStatu'
        }
    ],

    UI.Facets                     : [

    {
        $Type : 'UI.ReferenceFacet',
        Target: 'toSaleItems/@UI.LineItem',
        Label : 'Sale Items',
        ID    : 'toSaleItems'
    },

    ]


);
