xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:modify" location="../WSDLs/BucketManager.wsdl" ::)

declare namespace ns1 = "http://pojo.web.api.icc.services.osp.in.alcatel.com/xsd";
declare namespace ns0 = "http://implementation.web.api.icc.services.osp.in.alcatel.com";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_BucketModify/";

declare function xf:IN_XQ_BucketModify($nroCelular as xs:string,
    $startDate as xs:string,
    $limitDate as xs:string,
    $units as xs:string,
    $rowIdentifier as xs:string)
    as element(ns0:modify) {
        <ns0:modify>
            <ns0:accountId>{ $nroCelular }</ns0:accountId>
            <ns0:idType>3</ns0:idType>
            <ns0:bucket>
                <ns1:initialQuantity>{$units}</ns1:initialQuantity>
                <ns1:limitDate>{substring($limitDate,1,19)}</ns1:limitDate>
                <ns1:remainingUnits>{$units}</ns1:remainingUnits>
                <ns1:rowIdentifier>{ $rowIdentifier}</ns1:rowIdentifier>
                <ns1:startDate>{substring($startDate,1,19)}</ns1:startDate>
            </ns0:bucket>
        </ns0:modify>
};

declare variable $nroCelular as xs:string external;
declare variable $startDate as xs:string external;
declare variable $limitDate as xs:string external;
declare variable $units as xs:string external;
declare variable $rowIdentifier as xs:string external;

xf:IN_XQ_BucketModify($nroCelular,
    $startDate,
    $limitDate,
    $units,
    $rowIdentifier)