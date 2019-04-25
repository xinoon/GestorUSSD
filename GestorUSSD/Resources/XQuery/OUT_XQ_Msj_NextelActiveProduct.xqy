xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:ussdOperacionResponse" location="../WSDL/USSDOperaciones.xsd" ::)

declare namespace ns0 = "http://ussd.operaciones.wom.ws.ncl.com";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/OUT_XQ_Msj_NextelActiveProduct/";

declare function xf:OUT_XQ_Msj_NextelActiveProduct($codError as xs:string,
    $msjError as xs:string)
    as element(ns0:ussdOperacionResponse) {
        <ns0:ussdOperacionResponse>
            <errorCode>{ $codError }</errorCode>
            <errorDescription>{ $msjError }</errorDescription>
        </ns0:ussdOperacionResponse>
};

declare variable $codError as xs:string external;
declare variable $msjError as xs:string external;

xf:OUT_XQ_Msj_NextelActiveProduct($codError,
    $msjError)