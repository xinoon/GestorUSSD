xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$localWebPortalDbaOutputCollection1" element="ns0:LocalWebPortalDbaOutputCollection" location="../WSDLs/LocalWebPortalDba.xsd" ::)
(:: pragma bea:global-element-return element="ns1:getImsiResponse" location="../WSDLs/LocalWebPortal.xsd" ::)

declare namespace ns1 = "http://local.web.portal.ws.ncl.nii.com";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/LocalWebPortalDba";
declare namespace xf = "http://tempuri.org/LocalWebPortal/Resources/XQuery/OUT_XQ_LocalWebPortal/";

declare function xf:OUT_XQ_LocalWebPortal($localWebPortalDbaOutputCollection1 as element(ns0:LocalWebPortalDbaOutputCollection))
    as element(ns1:getImsiResponse) {
        <ns1:getImsiResponse>
            {
                for $LocalWebPortalDbaOutput in $localWebPortalDbaOutputCollection1/ns0:LocalWebPortalDbaOutput
                return 
                    <ns1:LocalWebPortalOutput>
                        <ns1:imsi>{ data($LocalWebPortalDbaOutput/ns0:PORT_NUM) }</ns1:imsi>
                    </ns1:LocalWebPortalOutput>
            }
        </ns1:getImsiResponse>
};

declare variable $localWebPortalDbaOutputCollection1 as element(ns0:LocalWebPortalDbaOutputCollection) external;

xf:OUT_XQ_LocalWebPortal($localWebPortalDbaOutputCollection1)