xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:modify" location="../WSDLs/SogSubscriptionManager.wsdl" ::)

declare namespace ns1 = "http://pojo.web.api.icc.services.osp.in.alcatel.com/xsd";
declare namespace ns0 = "http://implementation.web.api.icc.services.osp.in.alcatel.com";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_SogSubscriptionManager_Modify/";

declare function xf:IN_XQ_SogSubscriptionManager_Modify($nrocelular as xs:string,
    $suscripcion as xs:string)
    as element(ns0:modify) {
        <ns0:modify>
            <ns0:subLineIdentifier>{ $nrocelular }</ns0:subLineIdentifier>
            <ns0:idType>3</ns0:idType>
            <ns0:sogSub>
                <ns1:serviceOfferGroupRef>{ $suscripcion }</ns1:serviceOfferGroupRef>
                <ns1:serviceRetailerName>2</ns1:serviceRetailerName>
                <ns1:state>6</ns1:state>
            </ns0:sogSub>
        </ns0:modify>
};

declare variable $nrocelular as xs:string external;
declare variable $suscripcion as xs:string external;

xf:IN_XQ_SogSubscriptionManager_Modify($nrocelular,
    $suscripcion)