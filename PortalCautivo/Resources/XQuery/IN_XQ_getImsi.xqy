xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getUpsellingCompraBolsas1" element="ns0:getUpsellingCompraBolsas" location="../WSDLs/BSCSUpsellingBolsasService_schema.xsd" ::)
(:: pragma bea:global-element-return element="ns1:getImsi" location="../../../LocalWebPortal/Resources/WSDLs/LocalWebPortal.xsd" ::)

declare namespace ns1 = "http://local.web.portal.ws.ncl.nii.com";
declare namespace ns0 = "http://upselling.bolsas.bscs.bundle.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_getImsi/";

declare function xf:IN_XQ_getImsi($getUpsellingCompraBolsas1 as element(ns0:getUpsellingCompraBolsas))
    as element(ns1:getImsi) {
        <ns1:getImsi>
            <ns1:cel_num>{ data($getUpsellingCompraBolsas1/nro_cel) }</ns1:cel_num>
        </ns1:getImsi>
};

declare variable $getUpsellingCompraBolsas1 as element(ns0:getUpsellingCompraBolsas) external;

xf:IN_XQ_getImsi($getUpsellingCompraBolsas1)