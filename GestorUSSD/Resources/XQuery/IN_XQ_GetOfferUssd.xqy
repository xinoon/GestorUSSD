xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$ussdOperacion1" element="ns1:ussdOperacion" location="../WSDL/USSDOperaciones.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getOffers" location="../WSDL/CONT.0010013.WOM.NEG.CampaignFunnelManagement.CampaignManagementService_2.0.wsdl" ::)

declare namespace ns1 = "http://ussd.operaciones.wom.ws.ncl.com";
declare namespace ns0 = "http://cm.mobilytix.comviva.com";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/IN_XQ_GetOfferUssd/";

declare function xf:IN_XQ_GetOfferUssd($ussdOperacion1 as element(ns1:ussdOperacion),
    $IdTransaccion as xs:string,
    $usuario as xs:string,
    $pass as xs:string)
    as element(ns0:getOffers) {
        <ns0:getOffers>
            <ns0:username>{ $usuario }</ns0:username>
            <ns0:password>{ $pass }</ns0:password>
            <ns0:MSISDN>{ data($ussdOperacion1/nroCelular) }</ns0:MSISDN>
            <ns0:Channel>USSD</ns0:Channel>
            <ns0:TransactionID>{ $IdTransaccion }</ns0:TransactionID>
        </ns0:getOffers>
};

declare variable $ussdOperacion1 as element(ns1:ussdOperacion) external;
declare variable $IdTransaccion as xs:string external;
declare variable $usuario as xs:string external;
declare variable $pass as xs:string external;

xf:IN_XQ_GetOfferUssd($ussdOperacion1,
    $IdTransaccion,
    $usuario,
    $pass)