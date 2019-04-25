xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getInfoMensajeDbaOutputCollection" element="ns0:getInfoMensajeDbaOutputCollection" location="../WSDL/getInfoMensajeDba.xsd" ::)
(:: pragma  type="anyType" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/getInfoMensajeDba";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/OUT_XQ_getMensaje_TO_EC/";

declare function xf:OUT_XQ_getMensaje_TO_EC($getInfoMensajeDbaOutputCollection as element(ns0:getInfoMensajeDbaOutputCollection))
    as element(*) {
        
        <mensaje>
            <ID_MSJ>{$getInfoMensajeDbaOutputCollection/ns0:getInfoMensajeDbaOutput[1]/ns0:ID_MSJ/text() }</ID_MSJ>
            <MSJ_DES>{$getInfoMensajeDbaOutputCollection/ns0:getInfoMensajeDbaOutput[1]/ns0:MSJ_DES/text()} </MSJ_DES>
            <MENSAJE>{ $getInfoMensajeDbaOutputCollection/ns0:getInfoMensajeDbaOutput[1]/ns0:MENSAJE/text() }</MENSAJE>
        </mensaje>
        
        
};

declare variable $getInfoMensajeDbaOutputCollection as element(ns0:getInfoMensajeDbaOutputCollection) external;

xf:OUT_XQ_getMensaje_TO_EC($getInfoMensajeDbaOutputCollection)