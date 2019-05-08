xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/BS_GetInfoMensaje";
(:: import schema at "../Specifications/BS_GetInfoMensaje.xsd" ::)

declare variable $input as xs:string external;

declare function local:func($input as xs:string) as element() (:: schema-element(ns1:BS_GetInfoMensajeInput) ::) {
    <ns1:BS_GetInfoMensajeInput>
        <ns1:idMsj>{fn:data($input)}</ns1:idMsj>
    </ns1:BS_GetInfoMensajeInput>
};

local:func($input)
