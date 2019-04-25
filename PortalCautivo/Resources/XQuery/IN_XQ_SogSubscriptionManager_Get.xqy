xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:get" location="../WSDLs/SogSubscriptionManager.wsdl" ::)

declare namespace ns0 = "http://implementation.web.api.icc.services.osp.in.alcatel.com";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_SogSubscriptionManager_Get/";

declare function xf:IN_XQ_SogSubscriptionManager_Get($nrocelular as xs:string,
    $suscripcion as xs:string)
    as element(ns0:get) {
        <ns0:get>
            <ns0:subLineIdentifier>{ $nrocelular }</ns0:subLineIdentifier>
            <ns0:idType>3</ns0:idType>
            <ns0:sogName>{ $suscripcion }</ns0:sogName>
        </ns0:get>
};

declare variable $nrocelular as xs:string external;
declare variable $suscripcion as xs:string external;

xf:IN_XQ_SogSubscriptionManager_Get($nrocelular,
    $suscripcion)