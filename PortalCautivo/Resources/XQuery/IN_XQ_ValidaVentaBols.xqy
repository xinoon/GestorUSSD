xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getValidaVentaBolsas1" element="ns1:getValidaVentaBolsas" location="../WSDLs/ValidaVentaBolsas.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../WSDLs/PROVI_BOLS_NII_BSCS_PORTAL_CAUTIVO_PKG_VALIDA_VENTAS_BUNDLE_PRC.xsd" ::)

declare namespace ns1 = "http://captive.portal.ws.ncl.nii.com";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_BSCS_PORTAL_CAUTIVO_PKG/VALIDA_VENTAS_BUNDLE_PRC/";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_ValidaVentaBols/";

declare function xf:IN_XQ_ValidaVentaBols($getValidaVentaBolsas1 as element(ns1:getValidaVentaBolsas))
    as element(ns0:InputParameters) {
        let $getValidaVentaBolsas := $getValidaVentaBolsas1
        return
            <ns0:InputParameters>
                <ns0:P_CLIENT_NAME>{ data($getValidaVentaBolsas/client_name) }</ns0:P_CLIENT_NAME>
                <ns0:P_PHONE_NUMBER>{ data($getValidaVentaBolsas/phone_number) }</ns0:P_PHONE_NUMBER>
                <ns0:P_SEGMENT_PROD>{ data($getValidaVentaBolsas/segment_prod) }</ns0:P_SEGMENT_PROD>
                <ns0:P_TRAFIC_TYPE>{ data($getValidaVentaBolsas/trafic_type) }</ns0:P_TRAFIC_TYPE>
                <ns0:P_PLAN>{ data($getValidaVentaBolsas/rate_plan) }</ns0:P_PLAN>
                <ns0:P_VALOR_BOLSA>{ data($getValidaVentaBolsas/valor_bolsa) }</ns0:P_VALOR_BOLSA>
            </ns0:InputParameters>
};

declare variable $getValidaVentaBolsas1 as element(ns1:getValidaVentaBolsas) external;

xf:IN_XQ_ValidaVentaBols($getValidaVentaBolsas1)