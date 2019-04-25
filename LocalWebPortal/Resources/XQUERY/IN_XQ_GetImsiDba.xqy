xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getImsi1" element="ns1:getImsi" location="../WSDLs/LocalWebPortal.xsd" ::)
(:: pragma bea:global-element-return element="ns0:LocalWebPortalDbaInput" location="../WSDLs/LocalWebPortalDba.xsd" ::)

declare namespace ns1 = "http://local.web.portal.ws.ncl.nii.com";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/LocalWebPortalDba";
declare namespace xf = "http://tempuri.org/LocalWebPortal/Resources/XQuery/IN_XQ_LocalWebPortal/";

declare function xf:IN_XQ_LocalWebPortal($getImsi1 as element(ns1:getImsi))
    as element(ns0:LocalWebPortalDbaInput) {
        <ns0:LocalWebPortalDbaInput>
            <ns0:cel_num>{ data($getImsi1/ns1:cel_num) }</ns0:cel_num>
        </ns0:LocalWebPortalDbaInput>
};

declare variable $getImsi1 as element(ns1:getImsi) external;

xf:IN_XQ_LocalWebPortal($getImsi1)