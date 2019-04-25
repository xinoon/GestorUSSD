xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:getInfoMensajeDbaInput" location="../WSDL/getInfoMensajeDba.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/getInfoMensajeDba";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/IN_XQ_getMensaje/";

declare function xf:IN_XQ_getMensaje($idMsj as xs:decimal)
    as element(ns0:getInfoMensajeDbaInput) {
        <ns0:getInfoMensajeDbaInput>
            <ns0:idMsj>{ $idMsj }</ns0:idMsj>
        </ns0:getInfoMensajeDbaInput>
};

declare variable $idMsj as xs:decimal external;

xf:IN_XQ_getMensaje($idMsj)