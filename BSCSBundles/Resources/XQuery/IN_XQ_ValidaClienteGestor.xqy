xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getSearchBSCSBundles1" element="ns0:getSearchBSCSBundles" location="../WSDLs/BSCSBundleService_schema1.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../WSDLs/PROVI_BOLS_VALIDA_BUNDLES_PRC.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/VALIDA_BUNDLES_PRC/";
declare namespace ns0 = "http://bolsas.bscs.bundle.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/BSCSBundles/Resources/XQuery/IN_XQ_ValidaClienteGestor/";

declare function xf:IN_XQ_ValidaClienteGestor($getSearchBSCSBundles1 as element(ns0:getSearchBSCSBundles))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_CUSTOMER_ID>{ data($getSearchBSCSBundles1/enterpriseID) }</ns1:P_CUSTOMER_ID>
            <ns1:P_CLIENT_NAME>{ data($getSearchBSCSBundles1/client_name) }</ns1:P_CLIENT_NAME>
        </ns1:InputParameters>
};

declare variable $getSearchBSCSBundles1 as element(ns0:getSearchBSCSBundles) external;

xf:IN_XQ_ValidaClienteGestor($getSearchBSCSBundles1)