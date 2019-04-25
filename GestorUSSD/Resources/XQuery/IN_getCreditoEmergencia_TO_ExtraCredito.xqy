xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:SuscribeExtraCredito" location="../WSDL/XMLSchema_1073651305.xsd" ::)

declare namespace ns0 = "http://operaciones.extracredito.wom.ws.ncl.com";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/IN_getCreditoEmergencia_TO_ExtraCredito/";

declare function xf:IN_getCreditoEmergencia_TO_ExtraCredito($nroCelular as xs:string)
    as element(ns0:SuscribeExtraCredito) {
        <ns0:SuscribeExtraCredito>
            <nroCelular>{ $nroCelular }</nroCelular>
        </ns0:SuscribeExtraCredito>
};

declare variable $nroCelular as xs:string external;

xf:IN_getCreditoEmergencia_TO_ExtraCredito($nroCelular)