xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getUpsellingCompraBolsas1" element="ns1:getUpsellingCompraBolsas" location="../WSDLs/BSCSUpsellingBolsasService_schema.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../WSDLs/PROVI_BOLS_GET_UPSELLING_COMPRA_BOLSAS.xsd" ::)

declare namespace ns1 = "http://upselling.bolsas.bscs.bundle.ws.ncl.nii.com";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_BSCS_PORTAL_CAUTIVO_PKG/GET_UPSELLING_COMPRA_BOLSAS/";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_BSCSUpsellingBolsas/";

declare function xf:IN_XQ_BSCSUpsellingBolsas($getUpsellingCompraBolsas1 as element(ns1:getUpsellingCompraBolsas),
    $P_SALDO as xs:decimal,
    $P_CONCAT_ID_PROD as xs:string)
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_PHONE_NUMBER>{ data($getUpsellingCompraBolsas1/nro_cel) }</ns0:P_PHONE_NUMBER>
            <ns0:P_PLAN>{ data($getUpsellingCompraBolsas1/rate_plan) }</ns0:P_PLAN>
            <ns0:P_SEGMENT_PROD>{ data($getUpsellingCompraBolsas1/segment_prod) }</ns0:P_SEGMENT_PROD>
            <ns0:P_CLIENT_NAME>{ data($getUpsellingCompraBolsas1/client_name) }</ns0:P_CLIENT_NAME>
            <ns0:P_TRAFIC_TYPE>{ data($getUpsellingCompraBolsas1/traffic_type) }</ns0:P_TRAFIC_TYPE>
            <ns0:P_CONCAT_ID_PROD>{ $P_CONCAT_ID_PROD }</ns0:P_CONCAT_ID_PROD>
            <ns0:P_SALDO>{ $P_SALDO }</ns0:P_SALDO>
            {
                for $platform_act in $getUpsellingCompraBolsas1/platform_act
                return
                    <ns0:PV_PLATFORMA>{ data($platform_act) }</ns0:PV_PLATFORMA>
            }
        </ns0:InputParameters>
};

declare variable $getUpsellingCompraBolsas1 as element(ns1:getUpsellingCompraBolsas) external;
declare variable $P_SALDO as xs:decimal external;
declare variable $P_CONCAT_ID_PROD as xs:string external;

xf:IN_XQ_BSCSUpsellingBolsas($getUpsellingCompraBolsas1,
    $P_SALDO,
    $P_CONCAT_ID_PROD)