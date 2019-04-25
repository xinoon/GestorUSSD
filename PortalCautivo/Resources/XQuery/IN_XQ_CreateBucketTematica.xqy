xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:create" location="../WSDLs/BucketManager.wsdl" ::)

declare namespace ns1 = "http://pojo.web.api.icc.services.osp.in.alcatel.com/xsd";
declare namespace ns0 = "http://implementation.web.api.icc.services.osp.in.alcatel.com";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_CreateBucketTematica/";

declare function xf:IN_XQ_CreateBucketTematica($startDate as xs:string,
    $limitDate as xs:string,
    $remainingUnits as xs:long,
    $nombreBucket as xs:string,
    $phoneNumber as xs:string)
    as element(ns0:create) {
        <ns0:create>
            <ns0:accountId>{ $phoneNumber }</ns0:accountId>
            <ns0:idType>3</ns0:idType>
            <ns0:bucket>
                <ns1:initialQuantity>{ $remainingUnits }</ns1:initialQuantity>
                <ns1:limitDate>{substring($limitDate,1,19)}</ns1:limitDate>
                <ns1:remainingUnits>{ $remainingUnits }</ns1:remainingUnits>
                <ns1:startDate>{substring($startDate,1,19)}</ns1:startDate>
                <ns1:usageLabelRef>{ $nombreBucket }</ns1:usageLabelRef>
                <ns1:validity>0</ns1:validity>
            </ns0:bucket>
        </ns0:create>
};

declare variable $startDate as xs:string external;
declare variable $limitDate as xs:string external;
declare variable $remainingUnits as xs:long external;
declare variable $nombreBucket as xs:string external;
declare variable $phoneNumber as xs:string external;

xf:IN_XQ_CreateBucketTematica($startDate,
    $limitDate,
    $remainingUnits,
    $nombreBucket,
    $phoneNumber)