xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:ussdOperacionResponse" location="../WSDL/USSDOperaciones.xsd" ::)

declare namespace ns0 = "http://ussd.operaciones.wom.ws.ncl.com";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/getConsultaSaldoTematicoResponse/";

declare function xf:getConsultaSaldoTematicoResponse($codigo as xs:string,
    $mensaje as xs:string)
    as element(ns0:ussdOperacionResponse) {
        <ns0:ussdOperacionResponse>
            <errorCode>{ $codigo }</errorCode>
            <errorDescription>{ $mensaje }</errorDescription>
        </ns0:ussdOperacionResponse>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;

xf:getConsultaSaldoTematicoResponse($codigo,
    $mensaje)