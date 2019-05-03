xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:searchBalancesICC-request" location="../WSDL/serviceSearchPrepagoICC-request.xsd" ::)

declare namespace ns0 = "http://ws.nextel.cl/schemas/searchBalanceIcc/alcatel/getAllInformation";
declare namespace xf = "http://tempuri.org/PrepaidWave/Resources/XQuery/IN_XQ_GetBucketSearchBalanceICC/";

declare function xf:IN_XQ_GetBucketSearchBalanceICC($phone_number as xs:string,
    $detail_bucket as xs:string, $tipBucket as xs:string)
    as element(ns0:searchBalancesICC-request) {
        <ns0:searchBalancesICC-request>
            <ns0:phone_number>{ $phone_number }</ns0:phone_number>
            <ns0:detail_bucket>{ replace(upper-case($detail_bucket),'[N]','Y')  }</ns0:detail_bucket>
            <ns0:tipBucket>{ $tipBucket }</ns0:tipBucket>
        </ns0:searchBalancesICC-request>
};

declare variable $phone_number as xs:string external;
declare variable $detail_bucket as xs:string external;
declare variable $tipBucket as xs:string external;


xf:IN_XQ_GetBucketSearchBalanceICC($phone_number,
    $detail_bucket,$tipBucket)