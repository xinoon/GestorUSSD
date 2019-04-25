xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$setNextelActiveProduct1" element="ns0:setNextelActiveProduct" location="../WSDLs/ConsultaICCPortal.xsd" ::)
(:: pragma bea:global-element-return element="ns0:setAjustaICCPortal" location="../WSDLs/AjustaICCPortal.xsd" ::)

declare namespace ns0 = "http://captive.portal.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_AjustaICCPortal/";

declare function xf:IN_XQ_AjustaICCPortal($setNextelActiveProduct1 as element(ns0:setNextelActiveProduct))
    as element(ns0:setAjustaICCPortal) {
        <ns0:setAjustaICCPortal>
            <phone_number>{ data($setNextelActiveProduct1/phone_number) }</phone_number>
            <tariff_prod>{ data($setNextelActiveProduct1/tariff_prod) }</tariff_prod>
        </ns0:setAjustaICCPortal>
};

declare variable $setNextelActiveProduct1 as element(ns0:setNextelActiveProduct) external;

xf:IN_XQ_AjustaICCPortal($setNextelActiveProduct1)