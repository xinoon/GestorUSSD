xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/SRV.020068.getUSSDTextMessage_1.0";
(:: import schema at "../Specifications/SRV_020068_getUSSDTextMessage_1_0.xsd" ::)

declare variable $input as xs:string external;

declare function local:func($input as xs:string) as element() (:: schema-element(ns1:SRV.020068.getUSSDTextMessage_1.0Input) ::) {
    <ns1:BS_GetInfoMensajeInput>
        <ns1:idMsj>{fn:data($input)}</ns1:idMsj>
    </ns1:BS_GetInfoMensajeInput>
};

local:func($input)
