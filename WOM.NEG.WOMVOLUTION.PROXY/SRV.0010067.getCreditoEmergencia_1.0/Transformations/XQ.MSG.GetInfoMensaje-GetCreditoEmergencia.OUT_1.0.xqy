xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/SRV.020068.getUSSDTextMessage_1.0";
(:: import schema at "../Specifications/SRV_020068_getUSSDTextMessage_1_0.xsd" ::)

declare variable $input as element() (:: schema-element(ns1:SRV.020068.getUSSDTextMessage_1.0OutputCollection) ::) external;

declare function local:func($input as element() (:: schema-element(ns1:SRV.020068.getUSSDTextMessage_1.0OutputCollection) ::)) as element(mensaje) {
    <mensaje>
            <ID_MSJ>{$input/ns1:SRV.020068.getUSSDTextMessage_1.0Output[1]/ns1:ID_MSJ/text() }</ID_MSJ>
            <MSJ_DES>{$input/ns1:SRV.020068.getUSSDTextMessage_1.0Output[1]/ns1:MSJ_DES/text()} </MSJ_DES>
            <MENSAJE>{ $input/ns1:SRV.020068.getUSSDTextMessage_1.0Output[1]/ns1:MENSAJE/text() }</MENSAJE>
        </mensaje>

};

local:func($input)
