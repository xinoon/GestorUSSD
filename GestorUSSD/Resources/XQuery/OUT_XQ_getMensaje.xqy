xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getInfoMensajeDbaOutputCollection1" element="ns0:getInfoMensajeDbaOutputCollection" location="../WSDL/getInfoMensajeDba.xsd" ::)
(:: pragma bea:global-element-return element="ns1:ussdOperacionResponse" location="../WSDL/USSDOperaciones.xsd" ::)

declare namespace ns1 = "http://ussd.operaciones.wom.ws.ncl.com";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/getInfoMensajeDba";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/OUT_XQ_getMensajePromocional/";

declare function xf:OUT_XQ_getMensajePromocional($getInfoMensajeDbaOutputCollection1 as element(ns0:getInfoMensajeDbaOutputCollection))
    as element(ns1:ussdOperacionResponse) {
        <ns1:ussdOperacionResponse>
            <errorCode>0</errorCode>
            <errorDescription>{ $getInfoMensajeDbaOutputCollection1/ns0:getInfoMensajeDbaOutput[1]/ns0:MENSAJE/text() }</errorDescription>
        </ns1:ussdOperacionResponse>
};

declare variable $getInfoMensajeDbaOutputCollection1 as element(ns0:getInfoMensajeDbaOutputCollection) external;

xf:OUT_XQ_getMensajePromocional($getInfoMensajeDbaOutputCollection1)