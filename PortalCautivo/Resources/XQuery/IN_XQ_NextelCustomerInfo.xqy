xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getNextelCustomerInfo1" element="ns0:getNextelCustomerInfo" location="../WSDLs/CaptivePortalService_schema1.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../WSDLs/PROVI_BOLS_NII_BSCS_PORTAL_CAUTIVO_PKG_NEXTEL_CUSTOMER_INFO_PRC.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_BSCS_PORTAL_CAUTIVO_PKG/NEXTEL_CUSTOMER_INFO_PRC/";
declare namespace ns0 = "http://captive.portal.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_NextelCustomerInfo/";

declare function xf:IN_XQ_NextelCustomerInfo($getNextelCustomerInfo1 as element(ns0:getNextelCustomerInfo))
    as element(ns1:InputParameters) {
        let $getNextelCustomerInfo := $getNextelCustomerInfo1
        return
            <ns1:InputParameters>
                <ns1:P_PHONE_NUMBER>{ data($getNextelCustomerInfo/phone_number) }</ns1:P_PHONE_NUMBER>
            </ns1:InputParameters>
};

declare variable $getNextelCustomerInfo1 as element(ns0:getNextelCustomerInfo) external;

xf:IN_XQ_NextelCustomerInfo($getNextelCustomerInfo1)