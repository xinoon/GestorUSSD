xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:ussdOperacionResponse" location="../WSDL/USSDOperaciones.xsd" ::)

declare namespace ns0 = "http://ussd.operaciones.wom.ws.ncl.com";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/OUT_XQ_getMenuSalidaUssd/";

declare function xf:OUT_XQ_getMenuSalidaUssd($ResultSegmento as xs:string)
    as element(ns0:ussdOperacionResponse) {
        <ns0:ussdOperacionResponse>
            <segmento>{ $ResultSegmento }</segmento>
            <errorCode>0</errorCode>
            <errorDescription>OK</errorDescription>
        </ns0:ussdOperacionResponse>
};

declare variable $ResultSegmento as xs:string external;

xf:OUT_XQ_getMenuSalidaUssd($ResultSegmento)