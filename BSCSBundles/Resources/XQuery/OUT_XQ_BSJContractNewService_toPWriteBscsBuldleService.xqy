xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$jcontractCreateReturn1" element="ns1:JcontractCreateReturn" location="../../../3GBSCS/Resources/WSDLs/JcontractCreate.wsdl" ::)
(:: pragma bea:global-element-return element="ns0:setWriteBSCSBundleResponse" location="../WSDLs/BSCSBundleService_schema1.xsd" ::)

declare namespace ns1 = "http://www.lhsgroup.com/ws_v2_NII_1";
declare namespace ns0 = "http://bolsas.bscs.bundle.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/BSCSBundles/Resources/XQuery/OUT_XQ_BSJContractNewService_toPWriteBscsBuldleService/";

declare function xf:OUT_XQ_BSJContractNewService_toPWriteBscsBuldleService($jcontractCreateReturn1 as element(ns1:JcontractCreateReturn))
    as element(ns0:setWriteBSCSBundleResponse) {
        <ns0:setWriteBSCSBundleResponse>
            <errorCode>0</errorCode>
            <errorDescription>{ data($jcontractCreateReturn1/ns1:contractNew/ns1:coId) }</errorDescription>
        </ns0:setWriteBSCSBundleResponse>
};

declare variable $jcontractCreateReturn1 as element(ns1:JcontractCreateReturn) external;

xf:OUT_XQ_BSJContractNewService_toPWriteBscsBuldleService($jcontractCreateReturn1)