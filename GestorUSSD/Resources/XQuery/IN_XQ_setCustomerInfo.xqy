xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:getNextelCustomerInfo" location="../../../PortalCautivo/Resources/WSDLs/CaptivePortalService_schema1.xsd" ::)

declare namespace ns0 = "http://captive.portal.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/IN_XQ_setCustomerInfo/";

declare function xf:IN_XQ_setCustomerInfo($nroCelular as xs:string)
    as element(ns0:getNextelCustomerInfo) {
        <ns0:getNextelCustomerInfo>
            <phone_number>{ $nroCelular }</phone_number>
        </ns0:getNextelCustomerInfo>
};

declare variable $nroCelular as xs:string external;

xf:IN_XQ_setCustomerInfo($nroCelular)