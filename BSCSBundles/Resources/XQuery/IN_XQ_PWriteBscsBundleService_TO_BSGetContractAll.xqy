xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$setWriteBSCSBundle1" element="ns1:setWriteBSCSBundle" location="../WSDLs/BSCSBundleService_schema1.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../WSDLs/PROVI_BOLS_NII_BSCS_BUNDLES_PKG_GET_ACCOUNT_DUMMY.xsd" ::)

declare namespace ns1 = "http://bolsas.bscs.bundle.ws.ncl.nii.com";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_BSCS_BUNDLES_PKG/GET_ACCOUNT_DUMMY/";
declare namespace xf = "http://tempuri.org/BSCSBundles/Resources/XQuery/IN_XQ_PWriteBscsBundleService_TO_BSGetContractAll/";

declare function xf:IN_XQ_PWriteBscsBundleService_TO_BSGetContractAll($setWriteBSCSBundle1 as element(ns1:setWriteBSCSBundle))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_CUSTOMER_ID>{ data($setWriteBSCSBundle1/enterpriseID) }</ns0:P_CUSTOMER_ID>
        </ns0:InputParameters>
};

declare variable $setWriteBSCSBundle1 as element(ns1:setWriteBSCSBundle) external;

xf:IN_XQ_PWriteBscsBundleService_TO_BSGetContractAll($setWriteBSCSBundle1)