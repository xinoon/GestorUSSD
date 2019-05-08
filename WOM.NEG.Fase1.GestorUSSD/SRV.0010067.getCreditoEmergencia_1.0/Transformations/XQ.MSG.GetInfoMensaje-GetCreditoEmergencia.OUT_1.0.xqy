xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/BS_GetInfoMensaje";
(:: import schema at "../Specifications/BS_GetInfoMensaje.xsd" ::)

declare variable $input as element() (:: schema-element(ns1:BS_GetInfoMensajeOutputCollection) ::) external;

declare function local:func($input as element() (:: schema-element(ns1:BS_GetInfoMensajeOutputCollection) ::)) as element(mensaje) {
    <mensaje>
            <ID_MSJ>{$input/ns1:BS_GetInfoMensajeOutput[1]/ns1:ID_MSJ/text() }</ID_MSJ>
            <MSJ_DES>{$input/ns1:BS_GetInfoMensajeOutput[1]/ns1:MSJ_DES/text()} </MSJ_DES>
            <MENSAJE>{ $input/ns1:BS_GetInfoMensajeOutput[1]/ns1:MENSAJE/text() }</MENSAJE>
        </mensaje>

};

local:func($input)
