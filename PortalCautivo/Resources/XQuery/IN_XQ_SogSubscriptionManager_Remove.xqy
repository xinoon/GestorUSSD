xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:remove" location="../WSDLs/SogSubscriptionManager.wsdl" ::)

declare namespace ns1 = "http://pojo.web.api.icc.services.osp.in.alcatel.com/xsd";
declare namespace ns0 = "http://implementation.web.api.icc.services.osp.in.alcatel.com";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_SogSubscriptionManager_Remove/";

declare function xf:IN_XQ_SogSubscriptionManager_Remove($nrocelular as xs:string,
    $suscripcion as xs:string)
    as element(ns0:remove) {
        <ns0:remove>
            <ns0:subLineIdentifier>{ $nrocelular }</ns0:subLineIdentifier>
            <ns0:idType>3</ns0:idType>
            <ns0:sogSub>
                <ns1:serviceOfferGroupRef>{ $suscripcion }</ns1:serviceOfferGroupRef>
                <ns1:serviceRetailerName>2</ns1:serviceRetailerName>
            </ns0:sogSub>
        </ns0:remove>
};

declare variable $nrocelular as xs:string external;
declare variable $suscripcion as xs:string external;

xf:IN_XQ_SogSubscriptionManager_Remove($nrocelular,
    $suscripcion)