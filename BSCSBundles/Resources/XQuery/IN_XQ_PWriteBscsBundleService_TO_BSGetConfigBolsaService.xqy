xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$setWriteBSCSBundle1" element="ns0:setWriteBSCSBundle" location="../WSDLs/BSCSBundleService_schema1.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../WSDLs/PROVI_BOLS_NII_BSCS_BUNDLES_PKG_GET_CONFIG_BOLSAS_BY_FILTER_FN.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_BSCS_BUNDLES_PKG/GET_CONFIG_BOLSAS_BY_FILTER_FN/";
declare namespace ns0 = "http://bolsas.bscs.bundle.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/BSCSBundles/Resources/XQuery/IN_XQ_PWriteBscsBundleService_TO_BSGetConfigBolsaService/";

declare function xf:IN_XQ_PWriteBscsBundleService_TO_BSGetConfigBolsaService($setWriteBSCSBundle1 as element(ns0:setWriteBSCSBundle))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_CLIENT_NAME>{ data($setWriteBSCSBundle1/client_Name) }</ns1:P_CLIENT_NAME>
            <ns1:P_LEVEL_APPLY>10</ns1:P_LEVEL_APPLY>
        </ns1:InputParameters> 
};

declare variable $setWriteBSCSBundle1 as element(ns0:setWriteBSCSBundle) external;

xf:IN_XQ_PWriteBscsBundleService_TO_BSGetConfigBolsaService($setWriteBSCSBundle1)