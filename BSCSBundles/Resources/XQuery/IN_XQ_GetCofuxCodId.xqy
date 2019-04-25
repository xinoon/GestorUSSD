xquery version "2004-draft";
(:: pragma bea:local-element-parameter parameter="$services1" type="ns1:setWriteBSCSBundle/packages/item_pkg/services" location="../WSDLs/BSCSBundleService_schema1.xsd" ::)
(:: pragma  parameter="$tmcCode" type="anyType" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../WSDLs/PROVI_BOLS_NII_BSCS_BUNDLES_PKG_GET_COFU_X_CODID.xsd" ::)

declare namespace ns1 = "http://bolsas.bscs.bundle.ws.ncl.nii.com";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_BSCS_BUNDLES_PKG/GET_COFU_X_CODID/";
declare namespace xf = "http://tempuri.org/BSCSBundles/Resources/XQuery/IN_XQ_GetCofuxCodId/";

declare function xf:IN_XQ_GetCofuxCodId($services1 as element(),
    $tmcCode as element(*))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_TMCODE>{ $tmcCode/@* , $tmcCode/node() }</ns0:P_TMCODE>
            <ns0:P_SNCODE>{ data($services1/item_srv[1]/sncode) }</ns0:P_SNCODE>
        </ns0:InputParameters>
};

declare variable $services1 as element() external;
declare variable $tmcCode as element(*) external;

xf:IN_XQ_GetCofuxCodId($services1,
    $tmcCode)