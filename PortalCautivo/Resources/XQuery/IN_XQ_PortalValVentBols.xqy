xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../WSDLs/PROVI_BOLS_NII_BSCS_PORTAL_CAUTIVO_PKG_GET_CATALOGO_PRODUCTOS_INT_PRC.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getValidaVentaBolsas" location="../WSDLs/ValidaVentaBolsas.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_BSCS_PORTAL_CAUTIVO_PKG/GET_CATALOGO_PRODUCTOS_INT_PRC/";
declare namespace ns0 = "http://captive.portal.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_PortalValVentBols/";

declare function xf:IN_XQ_PortalValVentBols($outputParameters1 as element(ns1:OutputParameters),
    $client_name as xs:string,
    $phone_number as xs:string,
    $rate_plan as xs:string)
    as element(ns0:getValidaVentaBolsas) {
        <ns0:getValidaVentaBolsas>
            <client_name>{ $client_name }</client_name>
            <phone_number>{ $phone_number }</phone_number>
            <segment_prod>{ data($outputParameters1/ns1:SV_SEGMENT_PROD) }</segment_prod>
            <trafic_type>{ data($outputParameters1/ns1:SV_TRAFFIC_TYPE) }</trafic_type>
            <rate_plan>{ $rate_plan }</rate_plan>
            <valor_bolsa>{ data($outputParameters1/ns1:SN_TARIFF_PROD) }</valor_bolsa>
        </ns0:getValidaVentaBolsas>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $client_name as xs:string external;
declare variable $phone_number as xs:string external;
declare variable $rate_plan as xs:string external;

xf:IN_XQ_PortalValVentBols($outputParameters1,
    $client_name,
    $phone_number,
    $rate_plan)