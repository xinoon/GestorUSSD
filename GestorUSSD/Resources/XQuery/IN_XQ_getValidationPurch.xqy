xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:purchaseValidationReq" location="../WSDL/purchaseValidationReq2.0.xsd" ::)

declare namespace ns0 = "http://ws.wom.cl/WOM/NEG/ProductCatalog/purchaseValidation/v/2.0";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/IN_XQ_getValidationPurch/";

declare function xf:IN_XQ_getValidationPurch($nroCelular as xs:string,
    $idProd as xs:string)
    as element(ns0:purchaseValidationReq) {
        <ns0:purchaseValidationReq>
            <ns0:msisdn>{ $nroCelular }</ns0:msisdn>
            <ns0:idProducto>{ $idProd }</ns0:idProducto>
            <ns0:channel>USSD</ns0:channel>
        </ns0:purchaseValidationReq>
};

declare variable $nroCelular as xs:string external;
declare variable $idProd as xs:string external;

xf:IN_XQ_getValidationPurch($nroCelular,
    $idProd)