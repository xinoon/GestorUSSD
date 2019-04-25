xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:get" location="../WSDLs/BSAccount.wsdl" ::)

declare namespace ns0 = "http://implementation.web.api.icc.services.osp.in.alcatel.com";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_AccountManagerGet/";

declare function xf:IN_XQ_AccountManagerGet($nroCelular as xs:string)
    as element(ns0:get) {
        <ns0:get>
            <ns0:accountId>{ $nroCelular }</ns0:accountId>
            <ns0:accountIdType>3</ns0:accountIdType>
        </ns0:get>
};

declare variable $nroCelular as xs:string external;

xf:IN_XQ_AccountManagerGet($nroCelular)